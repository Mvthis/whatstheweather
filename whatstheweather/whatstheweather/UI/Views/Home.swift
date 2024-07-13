//
//  Home.swift
//  whatstheweather
//
//  Created by Mvthis on 08/07/2023.
//

import SwiftUI



struct Home: View {
    let bgColor = Color(red: 114/255, green: 128/255, blue: 250/255)
    @Binding var weatherData: WeatherModel?
    @State private var isSearchBarVisible = false
    @State private var favoriteCities: [String] = []


    var body: some View {
        NavigationView {
            ZStack {
                bgColor.ignoresSafeArea()

                ScrollView {
                    VStack {
                       HStack {
                           
                           Button(action: {
                               isSearchBarVisible = true
                           }, label: {
                               Image(systemName: "magnifyingglass")
                                   .imageScale(.large)
                                   .foregroundColor(.white)
                           })
                           .padding(15)

                           Button(action: {
                               if let cityName = weatherData?.cityName {
                                   if favoriteCities.contains(cityName) {
                                       favoriteCities.removeAll { $0 == cityName }
                                   } else {
                                       favoriteCities.append(cityName)
                                   }
                               }
                           }, label: {
                               if let cityName = weatherData?.cityName {
                                   Image(systemName: favoriteCities.contains(cityName) ? "star.fill" : "star")
                                       .imageScale(.large)
                                       .foregroundColor(.white)
                               } else {
                                   Image(systemName: "star")
                                       .imageScale(.large)
                                       .foregroundColor(.white)
                               }
                           })
                           .padding(15)
                       }
                        .alignmentGuide(.leading, computeValue: { _ in -40 })
                   }
                   .alignmentGuide(.top, computeValue: { _ in 0 })
                   .alignmentGuide(.trailing, computeValue: { _ in 0 })
                  

                    if let weatherData = weatherData { 
                        TitleComponent(cityName: weatherData.cityName, logo: "test")
                            .padding(20)

                        TemperatureComponent(temperature: weatherData.current.temp)
                            .padding(-30)

                        MainIconComponent(main: weatherData.current.weather[0].description, icon: weatherData.current.weather[0].icon)
                            .padding(10)

                        MinMaxComponent(min: weatherData.daily[0].temp.min, max: weatherData.daily[0].temp.max)
                            .padding(-5)
                             
                        HourlyComponent(hourly: weatherData.hourly)
                            .padding(30)

                        WeeklyComponent(daily: weatherData.daily)
                            .padding(-30)
                        
                        DetailsComponent(visibility: weatherData.current.visibility, pressure: weatherData.current.pressure, humidity: weatherData.current.humidity, sunrise: weatherData.current.sunrise, sunset: weatherData.current.sunset)
                            .padding(30)
                        
                        GraphCardComponent(hourly: weatherData.hourly)
                            .padding(-30)
                        
                        HStack{
                            FeelsLikeComponent(feels_like: weatherData.current.feels_like)
                                .padding(3)
                            UVComponent(uvi: weatherData.current.uvi)
                                .padding(3)
                        }
                        .padding(30)
                        HStack {
                            WindComponent(wind_deg: weatherData.current.wind_deg, wind_speed: weatherData.current.wind_speed)
                                .padding(3)
                            DewPointComponent(dew_point: weatherData.current.dew_point)
                                .padding(3)
                        }
                        .padding(-30)
                    }
                    Spacer(minLength: 50)
                    
                    
                }

               
           }
           .sheet(isPresented: $isSearchBarVisible, onDismiss: {

           }, content: {
               CitySearchView(isSearchBarVisible: $isSearchBarVisible, weatherData: $weatherData, favoriteCities: $favoriteCities)
           })
       }
       .onChange(of: favoriteCities) { newFavoriteCities in
           UserDefaults.standard.set(newFavoriteCities, forKey: "FavoriteCities")
       }
       .onAppear {
           if let savedFavoriteCities = UserDefaults.standard.stringArray(forKey: "FavoriteCities") {
               favoriteCities = savedFavoriteCities
           }
       }
   }
}


