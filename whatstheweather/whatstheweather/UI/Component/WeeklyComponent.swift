//
//  WeeklyComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 31/07/2023.
//

import SwiftUI

struct WeeklyComponent: View {
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    let daily: [DailyModel]?

    var body: some View {
        
        bgColor.opacity(0.3).ignoresSafeArea().overlay(
            ScrollView {
                VStack(spacing:-1) {
                    
                    Divider().padding(10)
                    
                    Text("PRÉVISIONS SUR 8 JOURS")
                        .foregroundColor(.secondary)
                        .font(.system(size: 13, weight: .bold))
                        .padding(.top, 10)
                    
                    ForEach(daily ?? [], id: \.dt) { data in
                        DailyComponent(day: data.dt, min: data.temp.min, max: data.temp.max, icon: data.weather[0].icon)
                        Divider().padding(-10)
                        
                    }
                }
                .frame(width: 350, height: 405)
                .cornerRadius(20)
            }
            )
        .frame(width: 370, height: 423)
            .cornerRadius(20)
            .shadow(radius: 10)
                
        }
        
}


struct WeeklyComponent_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyComponent(daily: [])
    }
}
