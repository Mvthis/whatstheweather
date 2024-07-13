//
//  TitleComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 13/07/2023.
//

import SwiftUI

struct TitleComponent: View {
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    let cityName: String?
    let logo : String
    var body: some View {
        
        if let cityName = cityName {
                    Text(cityName)
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .shadow(radius: 10)
                }
       
            
                   
        
        }
       
       
    }


struct TitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        TitleComponent(cityName: "Paris", logo: "test")
    }
}
