//
//  FoodListView.swift
//  cookWme
//
//  Created by icos on 1.12.2025.
//

import SwiftUI

struct FoodListView: View {
    
    let selectedCategory: Categories
    @EnvironmentObject var dataService: FoodDataService
    @State private var selectedCriteria: SortCriteria = .none
    @State private var selectedOrder: SortOrder = .ascending
    
    var body: some View {
        
        //  kategoriye göre yemekleri getirdi
        let filteredByCategory = dataService.getFoods(for: selectedCategory)
        
        //  filtreyi seçilen kritere göre sırala
        let sortedFoods = dataService.sortAndFilterFoods(
            foods: filteredByCategory,
            criteria: selectedCriteria,
            order: selectedOrder
        )
        
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: - SIRALAMA KONTROLLERİ
                SortControlView(
                    selectedCriteria: $selectedCriteria,
                    selectedOrder: $selectedOrder
                )
                    .padding(.horizontal)
                    .padding(.top)


                // MARK: - IZGARA
                let gridColumns = [GridItem(.flexible()),
                                   GridItem(.flexible())]
                
                LazyVGrid(columns: gridColumns, spacing: 15) {
                    // sortedFoods listesini kullanıyoruz
                    ForEach(sortedFoods) { food in
                        FoodGridCard(food: food)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
            }
                
        }
            .id(selectedCriteria.id + selectedOrder.id)
            .navigationTitle(selectedCategory.name)
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    FoodListView(selectedCategory: Categories.tumKategoriler[0])
        .environmentObject(FoodDataService())
}

