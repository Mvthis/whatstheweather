//
//  MinMaxComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 01/08/2023.
//

import SwiftUI

struct MinMaxComponent: View {
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    var min: Double?
    var max: Double?
    let minLogo = "min"
    let maxLogo = "max"
    var body: some View {
        HStack {
            HStack {
                
                Image(minLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .shadow(radius: 10)
                if let min = min {
                    Text(String(format: "%.0f°C", min))
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor( .white)
                        .shadow(radius: 10)
                } else {
                    Text("N/A")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor( .black)
                }
                Image(maxLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .shadow(radius: 10)
            }
                
               
                
                if let max = max {
                    Text(String(format: "%.0f°C", max))
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor( .white)
                        .shadow(radius: 10)
                } else {
                    Text("N/A")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor( .black)
                }
           
        }
    }
}

struct MinMaxComponent_Previews: PreviewProvider {
    static var previews: some View {
        MinMaxComponent(min: 10, max: 25)
    }
}
