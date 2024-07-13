//
//  UVComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 01/08/2023.
//

import SwiftUI

struct UVComponent: View {
    let uvi: Double?
    let uvLogo = "sunsvg"
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    var comment: String {
            guard let uvi = uvi else { return "" }
            switch uvi {
            case 0...2:
                return "Faible"
            case 3...5:
                return "Modéré"
            case 6...7:
                return "Élevé"
            case 8...10:
                return "Très Élevé"
            default:
                return "Extrême"
            }
        }
        
    var body: some View {
        bgColor.opacity(0.3).ignoresSafeArea().overlay(
            VStack {
                
                    Image(uvLogo)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Indice UV:")
                        .foregroundColor(.secondary)
                        .font(.system(size: 19))
                
                if let uvi = uvi {
                    Text(String(uvi))
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                } else {
                    Text("N/A")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                }
                Text(comment)
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
        )
        .frame(width: 180, height: 180)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct UVComponent_Previews: PreviewProvider {
    static var previews: some View {
        UVComponent(uvi: 7)
    }
}

