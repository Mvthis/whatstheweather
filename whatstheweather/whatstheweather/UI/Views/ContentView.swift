//
//  ContentView.swift
//  whatstheweather
//
//  Created by Mehdi Zerfaoui on 08/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationService = LocationService()
    private var weatherService = WeatherService()
    @State private var weatherData: WeatherModel?
    @State private var isSearchBarVisible = false

    var body: some View {
        VStack {
            Home(weatherData: $weatherData)
                .onAppear {
                    locationService.requestLocation()
                }
                .onReceive(locationService.$userLocation) { userLocation in
                    if let userLocation = userLocation {
                        weatherService.fetchWeatherData(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude) { weatherModel, error in
                            if let error = error {
                                print("Error fetching weather data: \(error.localizedDescription)")
                            } else if let weatherModel = weatherModel {
                                DispatchQueue.main.async {
                                    self.weatherData = weatherModel
                                }
                            }
                        }
                    }
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

