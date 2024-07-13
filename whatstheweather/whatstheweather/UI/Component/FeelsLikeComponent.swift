//
//  FeelsLikeComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 01/08/2023.
//

import SwiftUI

struct FeelsLikeComponent: View {
    let feels_like: Double?
    let feelsLogo = "tempsvg"
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)

    var body: some View {
        bgColor.opacity(0.3).ignoresSafeArea().overlay(
            VStack {
            
                    
                    Image(feelsLogo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text("Ressenti:")
                        .foregroundColor(.secondary)
                        .font(.system(size: 19))
                
                if let feels_like = feels_like {
                    Text(String(format: "%.0f°C", feels_like))
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                } else {
                    Text("N/A")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                }
            }
        )
        .frame(width: 180, height: 180)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct FeelsLikeComponent_Previews: PreviewProvider {
    static var previews: some View {
        FeelsLikeComponent(feels_like: 23.00)
    }
}

