//
//  VisibilityComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 01/08/2023.
//

import SwiftUI

struct VisibilityComponent: View {
    let visibility: Int?
    let visibilityLogo = "eyesvg"
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    
    func convertMetersToKilometers(_ meters: Int) -> Double {
          return Double(meters) / 1000.0
      }
    
    var body: some View {
        bgColor.opacity(0.3).ignoresSafeArea().overlay(
            VStack {
            
                    Image(visibilityLogo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text("Visibilité:")
                    .foregroundColor(.secondary)
                    .font(.system(size: 19))
                
                if let visibility = visibility {
                    let visibilityInKm = convertMetersToKilometers(visibility)
                                       Text("\(String(format: "%.f", visibilityInKm)) KM")
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

struct VisibilityComponent_Previews: PreviewProvider {
    static var previews: some View {
        VisibilityComponent(visibility: 20000)
    }
}
