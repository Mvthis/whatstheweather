//
//  CitySearchView.swift
//  whatstheweather
//
//  Created by Mehdi Zerfaoui on 20/07/2023.
//

import SwiftUI

struct CitySearchView: View {
    @State private var cityName: String = ""
    @ObservedObject var viewModel: CitySearchViewModel = CitySearchViewModel()
    @Binding var isSearchBarVisible: Bool
    @Binding var weatherData: WeatherModel?
    @Binding var favoriteCities: [String]
    let bgColor = Color(red: 114/255, green: 128/255, blue: 250/255)

    var body: some View {
        bgColor.ignoresSafeArea().overlay(
        VStack {
            TextField("Entrez le nom d'une ville", text: $cityName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                

            Button("Rechercher") {
                viewModel.searchCity(cityName)
                isSearchBarVisible = false
            }
            .padding()
            .foregroundColor(Color.white)

                            List {
                    Section(header: Text("Villes favorites")) {
                        ForEach(favoriteCities, id: \.self) { city in
                            Button(action: {
                                loadWeatherData(for: city)
                            }, label: {
                                Text(city)
                                    .foregroundColor(Color.white)
                            })
                            .listRowBackground(Color.secondary)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
        }
        .padding()
        .onReceive(viewModel.$weatherData) { weatherData in
            if let weatherData = weatherData {
                self.weatherData = weatherData
            }
        }
        )
    }

    private func loadWeatherData(for city: String) {
        viewModel.searchCity(city)
        isSearchBarVisible = false
    }
}



/*struct CitySearchView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CitySearchViewModel()
        CitySearchView(viewModel: viewModel, isSearchBarVisible: .constant(false))
    }
}*/
