//
//  TemperatureComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 18/07/2023.
//

import SwiftUI

struct TemperatureComponent: View {
    let temperature: Double?
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)

    var body: some View {
//        bgColor.ignoresSafeArea().overlay(
            ZStack {
                if let temperature = temperature {
                    Text(String(format: "%.0f°C", temperature))
                        .foregroundColor(.white)
                        .font(.system(size: 85, weight: .bold))
                } else {
                    Text("N/A")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                }
            }
//        )
        .frame(width: 450, height: 90)
        .cornerRadius(50)
        .shadow(radius: 10)
    }
}

struct TemperatureComponent_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureComponent(temperature: 23.00)
    }
}
