//
//  GraphComponent.swift
//  whatstheweather
//
//  Created by Mvthis on 03/08/2023.
//

import SwiftUI

struct GraphComponent: View {
    let dataPoints: [WeatherDataByTime]?
    let minValue: Double
    let maxValue: Double
    
    private var temperatureRange: Double {
        return maxValue - minValue
    }
    
    private func normalizedTemperature(_ temperature: Double) -> Double {
        return (temperature - minValue) / temperatureRange
    }
    
    private func convertTo24HourFormat(timeInterval: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date = Date(timeIntervalSince1970: timeInterval)
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let scalingFactor: CGFloat = 0.9

            ZStack {
                VStack(spacing: 0) {
                    ForEach(0..<6) { _ in
                        Divider()
                    }
                }
                .foregroundColor(.gray)
                .opacity(0.5)
                
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: geometry.size.height * scalingFactor))
                }
                .stroke(Color.black, lineWidth: 2)
                
                Path { path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height ))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height ))
                }
                .stroke(Color.black.opacity(0), lineWidth: 2)
                .padding(-14)
                
                if let hourlyData = dataPoints {
                    let xStep = geometry.size.width / CGFloat(hourlyData.count - 1)
                    let yStep = geometry.size.height / 5
                    
                    ForEach(0..<hourlyData.count, id: \.self) { index in
                        if index % (hourlyData.count / 8) == 0 {
                            let data = hourlyData[index]
                            let x = CGFloat(index) * xStep * scalingFactor
                            let y = CGFloat(1 - normalizedTemperature(data.temp)) * (geometry.size.height - yStep) * scalingFactor
                            Text(convertTo24HourFormat(timeInterval: data.dt))
                                .font(.system(size: 8 * scalingFactor))
                                .foregroundColor(.black)
                                .position(x: x, y: geometry.size.height - 10 * scalingFactor)
                                .padding(4)
                        }
                    }
                    
                    let path = Path { path in
                        for (index, data) in hourlyData.enumerated() {
                            let x = CGFloat(index) * xStep * scalingFactor
                            let y = CGFloat(1 - normalizedTemperature(data.temp)) * (geometry.size.height - yStep) * scalingFactor
                            
                            if index == 0 {
                                path.move(to: CGPoint(x: x, y: y))
                            } else {
                                path.addLine(to: CGPoint(x: x, y: y))
                            }
                        }
                        
                        let xFinal = CGFloat(hourlyData.count - 1) * xStep * scalingFactor
                        path.addLine(to: CGPoint(x: xFinal, y: geometry.size.height * scalingFactor))
                        path.addLine(to: CGPoint(x: 0, y: geometry.size.height * scalingFactor))
                        path.closeSubpath()
                    }
                    
                    Group {
                        path
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.9), .clear]), startPoint: .top, endPoint: .bottom))
                        
                        path
                            .stroke(Color.black, lineWidth: 2)
                    }
                    Text("\(Int(maxValue))°C")
                        .font(.system(size: 10 * scalingFactor))
                        .position(x: geometry.size.width * scalingFactor + 20, y: CGFloat(1.1 - normalizedTemperature(maxValue)) * (geometry.size.height - yStep) * scalingFactor)
                    Text("\(Int(minValue))°C")
                        .font(.system(size: 10 * scalingFactor))
                        .position(x: geometry.size.width * scalingFactor + 20, y: CGFloat(1 - normalizedTemperature(minValue)) * (geometry.size.height - yStep) * scalingFactor)
                }
            }
            .frame(width: geometry.size.width * scalingFactor, height: geometry.size.height * scalingFactor)
        }
    }
}





