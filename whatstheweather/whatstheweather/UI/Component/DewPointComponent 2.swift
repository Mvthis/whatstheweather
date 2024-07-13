//
//  DewPointComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 01/08/2023.
//

import SwiftUI

struct DewPointComponent: View {
    let dew_point: Double?
    let dewLogo = "dewsvg"
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)

    var body: some View {
        bgColor.opacity(0.3).ignoresSafeArea().overlay(
            VStack {
                Image(dewLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("Point de rosée:")
                    .foregroundColor(.secondary)
                    .font(.system(size: 19))
                if let dew_point = dew_point {
                    Text(String(format: "%.0f°C", dew_point))
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

struct DewPointComponent_Previews: PreviewProvider {
    static var previews: some View {
        DewPointComponent(dew_point: 11)
    }
}
