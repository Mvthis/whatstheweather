//
//  GraphCardComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 03/08/2023.
//

import SwiftUI

struct GraphCardComponent: View {
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    let hourly: [WeatherDataByTime]?
    
    var body: some View {
            bgColor.opacity(0.3).ignoresSafeArea().overlay(
                VStack {
                    Text("GRAPHIQUE DES TEMPÉRATURES PAR HEURE")
                        .foregroundColor(.secondary)
                        .font(.system(size: 13, weight: .bold))
                        .padding(.top, 10)

                    
                        HStack(spacing: 3000) {
                            GraphComponent(dataPoints: hourly, minValue: getMin(hourly: hourly ?? []), maxValue: getMax(hourly: hourly ?? []))
                                .frame(width: 350, height: 120)

                    }
                    .frame(width: 370, height: 120)
                }
            )
            .frame(width: 370, height: 180)
            .cornerRadius(20)
            .shadow(radius: 10)
            .foregroundColor(.primary) // Set the primary color for text within this component
        }
            
    }

private func getMin(hourly : [WeatherDataByTime]) -> Double {
    var min = 100.0
    for hour in hourly {
        if hour.temp < min {
            min = hour.temp
        }
    }
    return min
}

private func getMax(hourly : [WeatherDataByTime]) -> Double {
    var max = -100.0
    for hour in hourly {
        if hour.temp > max {
            max = hour.temp
        }
    }
    return max
}

struct GraphCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        GraphCardComponent(hourly: [])
    }
}
