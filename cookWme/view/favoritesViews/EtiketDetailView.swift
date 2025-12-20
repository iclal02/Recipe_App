//
//  EtiketDetailView.swift
//  cookWme
//
//  Created by icos on 6.12.2025.
//

import SwiftUI


struct EtiketDetailView: View {
    
    @EnvironmentObject var authService: AuthViewModel
    @EnvironmentObject var dataService: FoodDataService
    var etiket: FavoriEtiket
    
    var body: some View {
        
        let foods = authService.foodsForEtiket(etiket, allFoods: dataService.allFoods)
        
        VStack(alignment: .leading) {
            if foods.isEmpty {
                Text("Bu etikette henüz yemek yok.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(foods) { food in
                    NavigationLink {
                        FoodDetailView(food: food)
                    } label: {
                        Text(food.name)
                    }
                }
            }
        }
        .navigationTitle(etiket.name)
    }
}

#Preview {
    EtiketDetailView( etiket: FavoriEtiket.init(name: "Hızlı Yemekler", foodIDs: []))
        .environmentObject(AuthViewModel())}
