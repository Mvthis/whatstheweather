//
//   MainIconComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 02/08/2023.
//

import SwiftUI

struct MainIconComponent: View {
    var main : String?
    var icon : String?
    
    var body: some View {
        VStack(spacing: -20) {
            
            if let icon = icon {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .shadow(radius: 10)
            } else {
                Text("N/A")
            }
            
            if let main = main {
                Text(main.capitalized)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor( .white)
                    .shadow(radius: 10)
            } else {
                Text("N/A")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor( .white)
                    .shadow(radius: 10)
            }
        }
    }
}

struct MainIconComponent_Previews: PreviewProvider {
    static var previews: some View {
        MainIconComponent(main : "Pluvieux", icon: "03d")
    }
}
