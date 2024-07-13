//
//  HourlyComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 01/08/2023.
//

import SwiftUI

struct HourlyComponent: View {
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    let hourly: [WeatherDataByTime]?
    
    var body: some View {

        bgColor.opacity(0.3).ignoresSafeArea().overlay(
            
            VStack {
                
                Text("PRÉVISIONS HEURE PAR HEURE")
                    .foregroundColor(.secondary)
                    .font(.system(size: 13, weight: .bold))
                    .padding(.top, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: -1) {
                            ForEach(hourly ?? [], id: \.dt) { data in
                                WeatherByHourComponent(hour: data.dt, icon: data.weather[0].icon, temperature: data.temp)
                            }
                            .padding(12)
                        }
                    }
                }
            )
            .frame(width: 370, height: 170)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
            
    }

struct HourlyComponent_Previews: PreviewProvider {
    static var previews: some View {
        HourlyComponent(hourly: [])
    }
}



