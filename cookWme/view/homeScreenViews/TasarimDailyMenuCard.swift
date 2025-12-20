//
//  tasarimDailyMenu.swift
//  cookWme
//
//  Created by icos on 1.12.2025.
//

import Foundation
import SwiftUI


struct TasarimDailyMenuCard: View {
    
    // Food modelinden veri alıyor , binding almama nedenimiz bir veri alışverişi yok sadece gösterim olucak.
    let food: Food
    
    var body: some View {
        
        // Tıklanınca detay sayfasına giden NavigationLink
        NavigationLink(destination: FoodDetailView(food: food)) {
            
            ZStack(alignment: .bottomLeading) {
            
                Image(food.imageName.isEmpty ? "photo.fill" : food.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width:370,height: 250)
                    .clipped()
                    .cornerRadius(12)
                
                
                // Gölgelendirme (Metnin okunması için)
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.0),Color.black.opacity(0.6)]),
                    startPoint: UnitPoint(x:0.5, y: 0.8),
                    endPoint: .bottom
                )
                .cornerRadius(12)
                

                // Metin Alanı
                VStack(alignment: .leading, spacing: 4) {
                    Text(food.name)
                        .font(.title).bold()
                        .foregroundColor(.white)
                    Text("\(food.cookingTime) dakikada hazır • \(food.dificultlyLevel.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding(15)
            }
        }
        // .buttonStyle(PlainButtonStyle()) // Stil bozulmasını engeller
    }
}

#Preview {
    TasarimDailyMenuCard(food: FoodData.ornekYemekler[0])
        .environmentObject(FoodDataService())
}
