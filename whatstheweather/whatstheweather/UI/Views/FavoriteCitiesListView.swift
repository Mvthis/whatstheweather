//
//  FavoriteCitiesListView.swift
//  whatstheweather
//
//  Created by Mehdi Zerfaoui on 03/08/2023.
//

import SwiftUI

struct FavoriteCitiesListView: View {
    @Binding var favoriteCities: [String]
    let bgColor = Color(red: 114/255, green: 128/255, blue: 250/255)

    var body: some View {
        bgColor.opacity(0.3).ignoresSafeArea().overlay(
        VStack(alignment: .leading, spacing: 10) {
            Text("Villes favorites")
                .font(.headline)
                .padding(.top, 10)
            
            ForEach(favoriteCities, id: \.self) { city in
                Text(city)
            }
        }
        .padding(.horizontal)
        )
    }
        
}

/*
struct FavoriteCitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCitiesListView()
    }
}*/
