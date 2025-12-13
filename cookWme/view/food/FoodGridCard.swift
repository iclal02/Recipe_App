//
//  FoodGridCard.swift
//  cookWme
//
//  Created by icos on 3.12.2025.
//

import SwiftUI

struct FoodGridCard: View {
    
    @EnvironmentObject var dataService: FoodDataService
    let food: Food
    // Favori durumunu bu kartın içinde yerel olarak takip ediyoruz
    @State private var isFavorite: Bool
    // favori pickerına tıklanıp tıklanmadıgını kontrol etmek için kullanırız
    @State private var showEtiketPicker = false
    
    
    // View başlatılırken isFavorite durumunu yemeğin mevcut durumundan al
    init(food: Food) {
        self.food = food
        // isFavorite değişkenini, food nesnesinin mevcut durumundan başlatıyoruz
        _isFavorite = State(initialValue: food.isFavorite)
    }
    
    var body: some View {
        
        NavigationLink(destination: FoodDetailView(food: food)) {
            VStack(alignment: .leading, spacing: 5) {
                
                // MARK: - RESİM VE FAVORİ İKONU
                ZStack(alignment: .topTrailing) {
                    // Resim yer tutucu
                    Image(food.imageName.isEmpty ? "photo.fill" : food.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width:183,height: 180)
                        .clipped()
                        .cornerRadius(12)
                    
                    // Favori Butonu
                    Button {
                        showEtiketPicker = true
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.red)
                            .padding(10)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    .padding(.top, 6)
                    .padding(.trailing, 6)
                    // eger tıklandıysa showEtiketTutucu: true olur yani favori ekleme butonuna tıklandı demek tıklandıktan sonra ne olacagını belirtiriz.
                    .actionSheet(isPresented: $showEtiketPicker) {
                        ActionSheet(
                            title: Text("Hangi etikete eklemek istiyorsun?"),
                            buttons: etiketButtons()
                        )
                    }

                    
                }
                .cornerRadius(30)
                
                
                // MARK: - METİN VE DETAYLAR
                Text(food.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack {
                    Text("\(food.cookingTime) dk")
                    Text("•")
                    Text(food.dificultlyLevel.rawValue)
                        .foregroundColor(food.dificultlyLevel == .hard ? .red : .green)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                
            }
        }
    }
    
// kategorileri butonlaştırıyoruz.
func etiketButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = []
        
        for etiket in dataService.user.favoriEtiketleri {
            buttons.append(
                .default(Text(etiket.name)) {
                    dataService.addFoodToEtiket(food: food, etiket: etiket)
                }
            )
        }
        
        buttons.append(.cancel())
        return buttons
    }
    
}

#Preview {
    FoodGridCard( food: FoodData.ornekYemekler[0])
        .environmentObject(FoodDataService())
}
