//
//  WeatherDataView.swift
//  whatstheweather
//
//  Created by Mehdi Zerfaoui on 20/07/2023.
//

import SwiftUI

struct WeatherDataView: View {
    @ObservedObject var viewModel: CitySearchViewModel

    var body: some View {
        VStack {
            if let weatherData = viewModel.weatherData {
                Text("Latitude: \(weatherData.lat)")
                Text("Longitude: \(weatherData.lon)")
                Text("Timezone: \(weatherData.timezone)")
                Text(String(format: "Temperature: %.0f °C", weatherData.current.temp))
            } else {
                Text("Chargement des données...")
            }
        }
    }
}

struct WeatherDataView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CitySearchViewModel()
        WeatherDataView(viewModel: viewModel)
    }
}
