//
//  WeatherByHourComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 01/08/2023.
//

import SwiftUI

private func convertTo24HourFormat(timeInterval: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date = Date(timeIntervalSince1970: timeInterval)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }

struct WeatherByHourComponent: View {
    let hour : TimeInterval?
    let icon : String?
    let temperature : Double?
    let testLogo = "sunsvg"
    var base_url = "https://openweathermap.org/img/wn/"
    var body: some View {
    VStack {
        if let hour = hour {
            Text(convertTo24HourFormat(timeInterval: hour))
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold))
            
        } else {
            Text("N/A")
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .bold))
        }
        Image(icon ?? "eyesvg")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            .shadow(radius: 10)
        if let temperature = temperature {
            Text(String(format: "%.0f°C", temperature))
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold))
        } else {
            Text("N/A")
                .foregroundColor(.black)
                .font(.system(size: 60))
            }

        }
    }
}

struct WeatherByHourComponent_Previews: PreviewProvider {
    static var previews: some View {
        WeatherByHourComponent(hour: 1679809200, icon: "10d", temperature: 20)
    }
}
