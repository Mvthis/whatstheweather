//
//  WeatherService.swift
//  whatstheweather
//
//  Created by Mehdi Zerfaoui on 18/07/2023.
//

import Foundation
import CoreLocation

class WeatherService: ObservableObject {
    private let apiKey = ""
    private let baseUrl = "https://api.openweathermap.org/data/3.0/onecall"

    func fetchWeatherData(latitude: Double, longitude: Double, completion: @escaping (WeatherModel?, Error?) -> Void) {
        let endpoint = "\(baseUrl)?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric&lang=fr"

        guard let url = URL(string: endpoint) else {
            completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "No data received", code: -2, userInfo: nil))
                return
            }

            LocationService().fetchCity(from: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)) { cityName in
                do {
                    var weatherModel = try JSONDecoder().decode(WeatherModel.self, from: data)
                    weatherModel.cityName = cityName
                    completion(weatherModel, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    func fetchCoordinates(forCity cityName: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(cityName) { placemarks, error in
            if let error = error {
                completion(nil, error)
                return
            }

            if let location = placemarks?.first?.location {
                completion(location.coordinate, nil)
            } else {
                completion(nil, NSError(domain: "Location not found", code: -3, userInfo: nil))
            }
        }
    }
}
