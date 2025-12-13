//
//  FoodDetailView.swift
//  cookWme
//
//  Created by icos on 1.12.2025.
//
// FoodDetailView.swift

import SwiftUI

struct FoodDetailView: View {
    
    @EnvironmentObject var dataService: FoodDataService
    @State var food: Food
    @State private var showEtiketPicker = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                
                // MARK: - HEADER IMAGE
                ZStack(alignment: .topTrailing) {
                    Image(food.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                    
                    // FAVORITE BUTTON
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
                    .padding(.top, 10)
                    .padding(.trailing, 25)
                    .actionSheet(isPresented: $showEtiketPicker) {
                        ActionSheet(
                            title: Text("Hangi etikete eklemek istiyorsun?"),
                            buttons: etiketButtons()
                        )
                    }

                }
                
                // MARK: - TITLE & SUMMARY
                VStack(alignment: .leading, spacing: 8) {
                    Text(food.name)
                        .font(.system(size: 32, weight: .bold))
                }
                .padding(.horizontal)
                
                
                // MARK: - DETAIL STATS BOX
                HStack(spacing: 16) {
                    DetailMiniBox(icon: "clock", title: "\(food.cookingTime) dk")
                    DetailMiniBox(icon: "person.2", title: "4 kişilik")
                    DetailMiniBox(icon: "chart.bar.fill", title: food.dificultlyLevel.rawValue)
                }
                .padding(.horizontal)
                
                
                // MARK: - INGREDIENTS CARD
                VStack(alignment: .leading, spacing: 15) {
                    Text("Malzemeler")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach($food.ingredients) { $ingredient in
                        HStack {
                            Text(ingredient.name)
                                .strikethrough(ingredient.isChecked)
                            
                            Spacer()
                            
                            Image(systemName: ingredient.isChecked ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(ingredient.isChecked ? .green : .gray)
                                .font(.title3)
                                .onTapGesture {
                                    ingredient.isChecked.toggle()
                                    
                                    if ingredient.isChecked {
                                        dataService.addIngredientToShoppingList(ingredient: ingredient)
                                    } else {
                                        dataService.removeIngredientFromShoppingList(ingredient: ingredient)
                                    }
                                }
                        }
                        Divider()
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .padding(.horizontal)
                
                
                // MARK: - STEPS CARD
                VStack(alignment: .leading, spacing: 18) {
                    Text("Yapılışı")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(food.recipe.indices, id: \.self) { index in
                        HStack(alignment: .top, spacing: 16) {
                            
                            // STEP NUMBER
                            Text("\(index + 1)")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(.orange)
                                .clipShape(Circle())
                            
                            // STEP TEXT
                            Text(food.recipe[index])
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .padding(.horizontal)
                .padding(.bottom, 40)
                
            } // VStack end
        } // Scroll end
        .navigationBarTitleDisplayMode(.inline)
    }
    
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

struct DetailMiniBox: View {
    var icon: String
    var title: String
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
            Text(title)
        }
        .font(.subheadline)
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}



#Preview {
    FoodDetailView(food:FoodData.ornekYemekler[0])
        .environmentObject(FoodDataService())
}

