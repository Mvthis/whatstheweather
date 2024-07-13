//
//  WindComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 29/07/2023.
//

import SwiftUI

private func convertTo24HourFormat(timeInterval: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date = Date(timeIntervalSince1970: timeInterval)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }

func convertMetersToKilometers(_ meters: Int) -> Double {
      return Double(meters) / 1000.0
  }

struct DetailsComponent: View {
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    let visibility: Int?
    var pressure: Int?
    var humidity: Int?
    let sunrise: TimeInterval?
    let sunset: TimeInterval?
    let pressureLogo = "pressure"
    let humidityLogo = "humidity"
    let sunriseLogo = "sunrise"
    let sunsetLogo = "sunset"
    let visibilityLogo = "eyesvg"
    var body: some View {
        bgColor.opacity(0.3).ignoresSafeArea().overlay(
                
            VStack {
                
                Text("DÉTAILS DES PRÉVISIONS")
                    .foregroundColor(.secondary)
                    .font(.system(size: 13, weight: .bold))
                    .padding(.top, 10)
                
                HStack {
                    VStack {
                        Image(visibilityLogo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        
                        if let visibility = visibility {
                            let visibilityInKm = convertMetersToKilometers(visibility)
                            Text("\(String(format: "%.f", visibilityInKm)) KM")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor( .white)
                        } else {
                            Text("N/A")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor( .black)
                        }
                    }
                    
                    
                    Divider().frame(width: 10, height: 70)
                    
                    VStack {
                        HStack {
                            
                            Image(sunriseLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:30, height: 30)
                            
                            Image(sunsetLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                            
                        }
                        
                        HStack {
                            
                            if let sunriseTime = sunrise {
                                Text(convertTo24HourFormat(timeInterval: sunriseTime))
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor( .white)
                                
                            } else {
                                Text("N/A")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor( .white)
                            }
                            
                            if let sunsetTime = sunset {
                                Text(convertTo24HourFormat(timeInterval: sunsetTime))
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor( .white)
                            } else {
                                Text("N/A")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor( .white)
                            }
                        }
                        .frame(width: 100, height: 20)
                        
                    }
                    
                    Divider().frame(width: 10, height: 70)
                    
                    VStack {
                        Image(pressureLogo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        
                        if let pressure = pressure {
                            Text("\(pressure)°hPa")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                        } else {
                            Text("N/A")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                    
                    Divider().frame(width: 10, height: 70)
                    
                    VStack {
                        Image(humidityLogo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        
                        if let humidity = humidity {
                            Text("\(humidity)%")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                        } else {
                            Text("N/A")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding()
        )
        .frame(width: 370, height:120)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
            
}
struct DetailsComponent_Previews: PreviewProvider {
    static var previews: some View {
        DetailsComponent(visibility: 10, pressure: 1044, humidity: 45, sunrise: Date().timeIntervalSince1970, sunset: Date().timeIntervalSince1970 + 3600 )
    }
}
