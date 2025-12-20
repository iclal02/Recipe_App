//
//  HomeScreenView.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import SwiftUI

struct HomeScreenView: View {
    
    // Property Wrappers
    // Environment: Tüm uygulamanın aynı, canlı veri kaynağını kullandığı anlamına gelir.
    @EnvironmentObject var dataService: FoodDataService
    // State: SearchTextin asıl sahibinin bu dosya old gösterir. Diğer yerlerde kullanılacaksa binding olarak kullanılır.
    @State private var searchText = ""
    @State private var showSearchResults = false
    // var kullandıgımızda da bu degiskene kesin bir deger atamamız lazım.
    // let var aynı görevde kullanılır tek farkı let -> degistirilemez.
    
    
    // Arama yapılınca kullanılacak filtre fonksiyonu
    var filteredFoods: [Food] {
        
        let search = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        if search.isEmpty { return [] }
        
        return dataService.allFoods.filter { food in
            // İsimde ara
            let nameMatch = food.name.lowercased().contains(search)
            
            // Ingredients sözlüğünü stringe çevir
            let ingredientMatch = food.ingredients.contains { ingredient in
                        ingredient.name.lowercased().contains(search)
                    }
            
            return nameMatch || ingredientMatch
        }
    }
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                // .leading: soldan hizalar, spacing: alt viewler arasındaki boşluk miktarı
                VStack(alignment: .leading, spacing: 0) {
                    
                    // MARK: - 1. ARAMA ÇUBUĞU
                    // arama
                    HStack(spacing: 8) {
                        SearchComponent(searchText: $searchText) {
                            // entera basıldığında bu callback çalışacak
                            showSearchResults = true
                        }
                        
                        Button(action: {
                            // Butonla da arama başlat
                            showSearchResults = true
                        }) {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .font(.system(size: 28))
                        }
                        .disabled(searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        // Arama kutusu boşsa butonu kullanılamaz
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    
                    // MARK: - 2. GÜNÜN ÖNERİSİ BAŞLIĞI
                    Text("Günün Önerisi")
                        .font(.system(size: 30, weight: .bold))
                        .padding(.horizontal)
                        .padding(.top, 15)
                        .padding(.bottom, 8)
                    
                    // MARK: - 3. GÜNÜN ÖNERİSİ KARTI
                    // ilk başta yapılacak şey rastgele menü seçmek, 2. yapılacak bunu göstermek.
                    // dataservicede yazdıgımız dailymenu fonk. kullandık ve degiskene atadık, if yapısını da uyg. çökmemesi için kullanıyoruz.
                    
                    if let dailyFood = dataService.getDailyMenu() {
                        TasarimDailyMenuCard(food: dailyFood)
                            .padding(.horizontal)
                    }
                    
                    // MARK: - 4. KATEGORİLER BAŞLIĞI
                    Text("Kategoriler")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.horizontal)
                        .padding(.top, 30)
                        .padding(.bottom, 8)
                    
                    // MARK: - 5. KATEGORİLER IZGARASI (Grid)
                    let gridColumns = [GridItem(.flexible()), GridItem(.flexible())] // bir satırın nasıl görüneceğini belirledik
                    
                    // dikeyde ızgara kullanımı
                    LazyVGrid(columns: gridColumns, spacing: 15) {
                        
                        ForEach(dataService.allCategories) { category in
                            CategoryGridCard(category: category)
                        }
                    }
                    .padding(.horizontal)
                    
                }// vstack end
                
            }// scrollview end
                // Eğer showSearchResults = true olursa SearchResultView sayfasını açar
                .navigationDestination(isPresented: $showSearchResults) {
                    SearchResultView(query: searchText)
                        .environmentObject(dataService)
                }
        }// navigation end
    }// body end
}

#Preview {
    HomeScreenView()
        .environmentObject(FoodDataService())
}
