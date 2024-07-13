//
//  WeekComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 31/07/2023.
//

import SwiftUI

struct DailyComponent: View {
    let bgColor = Color(red: 168/255, green: 176/255, blue: 247/255)
    let day:  TimeInterval?
    let min: Double?
    var max: Double?
    let minLogo = "min"
    let maxlogo = "max"
    var icon: String?
    
    init(day: TimeInterval?, min: Double?, max: Double?, icon: String?) {
            self.day = day
            self.min = min
            self.max = max
            self.icon = icon
        }
    
    var body: some View {
            bgColor.opacity(0).ignoresSafeArea().overlay(
            HStack {
                
                if let day = day {
                    Text("\(formattedDate(from: day).capitalized)")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor( .white)
                        .frame(width: 90, alignment: .leading)
                    
                } else {
                    Text("N/A")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor( .black)
                        .frame(width: 70, alignment: .leading)
                }
                
                if let icon = icon {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding(20)
                } else {
                    Text("N/A")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor( .black)
                        .frame(width: 70, alignment: .leading)
                }
                
                Image(minLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                
                if let min = min {
                    let truncatedMin = String(format: "%.1f", min)
                    Text("\(truncatedMin)°C")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor( .white)
                } else {
                    Text("N/A")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor( .black)
                }
                
                Image(maxlogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                
                if let max = max {
                    let truncatedMax = String(format: "%.1f", max)
                    Text("\(truncatedMax)°C")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor( .white)
                } else {
                    Text("N/A")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor( .black)
                }
               
               
            }
        
        )
        .frame(width: 350, height: 50)
        
        
    }
    
}

private func formattedDate(from timestamp: TimeInterval) -> String {
       let date = Date(timeIntervalSince1970: timestamp)
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "EEEE"
       return dateFormatter.string(from: date)
   }

struct DailyComponent_Previews: PreviewProvider {
    static var previews: some View {
        DailyComponent(
                   day: 1679809200,
                   min: 10.5,
                   max: 25.7,
                   icon: "01d"
               )
    }
}
