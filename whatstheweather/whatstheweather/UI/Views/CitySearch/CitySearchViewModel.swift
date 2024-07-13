//
//  CitySearchViewModel.swift
//  whatstheweather
//
//  Created by Mehdi Zerfaoui on 20/07/2023.
//

import Foundation
import CoreLocation

class CitySearchViewModel: ObservableObject {
    @Published var weatherData: WeatherModel?
    private let weatherService = WeatherService()
    
    var weatherDataUpdated: ((WeatherModel) -> Void)?

    func searchCity(_ cityName: String) {
        weatherService.fetchCoordinates(forCity: cityName) { coordinates, error in
            if let error = error {
                print("Erreur lors de la récupération des coordonnées : \(error.localizedDescription)")
            } else if let coordinates = coordinates {
                self.weatherService.fetchWeatherData(latitude: coordinates.latitude, longitude: coordinates.longitude) { weatherModel, error in
                    if let error = error {
                        print("Erreur lors de la récupération des données : \(error.localizedDescription)")
                    } else if let weatherModel = weatherModel {
                        DispatchQueue.main.async {
                            self.weatherData = weatherModel
                            self.weatherDataUpdated?(weatherModel)
                        }
                    }
                }
            }
        }
    }
}
