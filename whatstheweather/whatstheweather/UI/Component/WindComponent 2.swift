//
//  WindComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 01/08/2023.
//

import SwiftUI
import WeatherKit

enum CompassDirection: String {
    case north = "Nord"
    case northEast = "Nord-Est"
    case east = "Est"
    case southEast = "Sud-Est"
    case south = "Sud"
    case southWest = "Sud-Ouest"
    case west = "Ouest"
    case northWest = "Nord-Ouest"
}

func getCompassDirection(for windDirection: Int) -> String {
    let directions: [CompassDirection] = [.north, .northEast, .east, .southEast, .south, .southWest, .west, .northWest]
    let index = Int((windDirection + 23) / 45) % 8
    return directions[index].rawValue
}

struct WindComponent: View {
    let wind_deg: Int?
    let wind_speed: Double?
    let windLogo = "wind"
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    var body: some View {
       
        bgColor.opacity(0.3).ignoresSafeArea().overlay(
            VStack {
                Image(windLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("Vitesse du vent:")
                    .foregroundColor(.secondary)
                    .font(.system(size: 19))
                if let wind_speed = wind_speed {
                    Text(String(format: "%.0f KM/h", wind_speed))
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                } else {
                    Text("N/A")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                }
                
                CompassView(windDirection: wind_deg ?? 90)
            }
            
        
        )
        .frame(width: 180, height: 180)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct CompassView: View {
    let windDirection: Int

    var body: some View {
        VStack {
            Text("Direction:")
                .foregroundColor(.secondary)
                .font(.system(size: 19))

            Text(getCompassDirection(for: windDirection))
                .foregroundColor(.white)
                .font(.system(size: 30))
                
                
        }
    }
}

struct WindComponent_Previews: PreviewProvider {
    static var previews: some View {
        WindComponent(wind_deg: 45, wind_speed: 12)
    }
}
