//
//  WeatherModel.swift
//  whatstheweather
//
//  Created by Mehdi Zerfaoui on 11/07/2023.
//

import Foundation

struct WeatherModel: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezone_offset: Int
    let current: CurrentWeatherData
    let hourly: [WeatherDataByTime]
    let daily: [DailyModel]
    var cityName: String?
}

struct CurrentWeatherData: Codable {
    let dt: TimeInterval
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double?
    let weather: [WeatherData]
    let rain: RainData?
}

struct WeatherData: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherDataByTime: Codable {
    let dt: TimeInterval
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double?
    let weather: [WeatherData]
    let pop: Double
    let rain: RainData?
}

struct DailyModel: Codable {
    let dt: TimeInterval
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let moonrise: TimeInterval
    let moonset: TimeInterval
    let moon_phase: Double
    let summary: String
    let temp: Temperature
    let feels_like: FeelsLike
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let weather: [DailyWeatherModel]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let snow: Double?
    let uvi: Double
}

struct Temperature: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct FeelsLike: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct DailyWeatherModel: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct RainData: Codable {
    let oneHour: Double?

    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}


//struct DailyWeatherData: Codable {
//    let dt: TimeInterval
//    let sunrise: TimeInterval
//    let sunset: TimeInterval
//    let moonrise: TimeInterval
//    let moonset: TimeInterval
//    let moon_phase: Double
//    let summary: String
//    let temp: Temperature
//    let feels_like: FeelsLike
//    let pressure: Int
//    let humidity: Int
//    let dew_point: Double
//    let wind_speed: Double
//    let wind_deg: Int
//    let wind_gust: Double?
//    let weather: [Weather]
//
//}
//
//struct Temperature: Codable {
//    let day: Double
//    let min: Double
//    let max: Double
//    let night: Double
//    let eve: Double
//    let morn: Double
//}
//
//struct FeelsLike: Codable {
//    let day: Double
//    let night: Double
//    let eve: Double
//    let morn: Double
//}


struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

class WeatherModelHolder: ObservableObject {
    @Published var weatherModel: WeatherModel?

    init(weatherModel: WeatherModel?) {
        self.weatherModel = weatherModel
    }
}
