//
//  FoodDataView.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import Foundation
import Combine
import SwiftUI

// Uygulamanın tüm verisini ve mantığını yönetecek ana sınıf
final class FoodDataService: ObservableObject {
    
    // MARK: - PUBLISHED VERİLER
    
    // Uygulamadaki tüm yemeklerin listesi.
    // '@Published' sayesinde bu dizi değiştiğinde arayüz otomatik yenilenir.
    @Published var allFoods: [Food] = FoodData.ornekYemekler
    
    // Ana sayfada gösterilecek sabit kategoriler
    @Published var allCategories: [Categories] = Categories.tumKategoriler
    
    // Favori yemeklerin dinamik listesi (AllFoods'tan filtrelenecek)
    @Published var favoriteFoods: [Food] = []
    
    // Alışveriş listesi öğeleri
    @Published var shoppingList: [ShoppingList] = []
    
    @State private var showEtiketPicker = false
    
    
    // MARK: - INITIALIZER (Başlatıcı)
    
    init() {
        // Uygulama ilk açıldığında çalışır.
        loadFavorites()
        loadShoppingList()
    }
    
    
    // MARK: - favori sayfası
    // favorilere ekleme
    func toggleFavorite(food: Food) {
        // AllFoods dizisinde, tıklanan yemeğin (ID'si eşleşen) index'ini bul.
        if let index = allFoods.firstIndex(where: { $0.id == food.id }) {
            
            allFoods[index].isFavorite.toggle()
            
            // '@Published' değişken güncellendiği için SwiftUI bunu otomatik bilecek.
            // Ama biz favoriteFoods listemizin de temiz kalması için manuel olarak güncelliyoruz.
            loadFavorites()
            
        }
    }
    // favorileri güncelleme
    private func loadFavorites() {
        favoriteFoods = allFoods.filter { $0.isFavorite }
    }
    
    // MARK: - alışveriş sayfası
    private func loadShoppingList() {
        shoppingList = []
    }
    
    // Alışveriş listesindeki bir öğenin alındı durumunu değiştirme
    func toggleShoppingItemStatus(item: ShoppingList) {
        if let index = shoppingList.firstIndex(where: { $0.id == item.id }) {
            shoppingList[index].isreceived.toggle()
        }
    }
    
    // alışveris sepetine ekleme
    func addIngredientToShoppingList(ingredient: Ingredient, recipeName: String) {
        // Basit ayrıştırma: isim içinde miktar varsa ayır
        // Eğer ingredient.name "2 dilim Kaşar" şeklindeyse,
        // burada basitçe son kelimeyi itemName kabul ediyorum.
        let parts = ingredient.name.split(separator: " ").map { String($0) }
        let itemName: String
        let amount: String
        
        if parts.count >= 2 {
            // Son kelime miktar olabilir; burada örnek basit ayırma:
            itemName = parts.dropLast().joined(separator: " ")
            amount = parts.last ?? ""
        } else {
            itemName = ingredient.name
            amount = ""
        }
        
        let newItem = ShoppingList(
            name: ingredient.name,
            amount: amount,
            recipeName: recipeName,
            isreceived: false
        )
        
        shoppingList.append(newItem)
        print("\(newItem.name) sepete eklendi.")
    }
    
    // sepetten çıkarma
    func removeIngredientFromShoppingList(ingredient: Ingredient, recipeName: String) {
        // Listedeki aynı isme sahip ürünü bul
        shoppingList.removeAll {
                $0.name.lowercased() == ingredient.name.lowercased() &&
                $0.recipeName == recipeName
            }
    }
    
    func deleteShoppingItems(at offsets: IndexSet, in items: [ShoppingList]) {
        for index in offsets {
            let item = items[index]
            
            shoppingList.removeAll {
                $0.id == item.id
            }
        }
    }

    
    
    // MARK: - kategorileme
    // Belirli bir kategoriye ait yemekleri filtreleyen fonksiyon
    func getFoods(for category: Categories) -> [Food] {
        return allFoods.filter { $0.categories == category.name }
    }
    
    // MARK: - günlük menü fonksiyonu
    // Günün Menüsü için rastgele bir yemek seçer
    func getDailyMenu() -> Food? {
        // Rastgele seçim için 'name' alanı boş olmayanlardan birini seç
        return allFoods.filter { !$0.name.isEmpty }.randomElement()
    }


    
    // MARK: - sıralama fonksiyonları
    // sıralama fonksiyonu
    func sortAndFilterFoods(
        foods: [Food],
        criteria: SortCriteria,
        order: SortOrder
    ) -> [Food] {
        
        // Sıralama Kriterinin kontrolü
        switch criteria {
        case .none:
            // Sıralama yoksa filtreyi olduğu gibi döndür
            return foods
            
        case .difficulty:
            // Zorluk Derecesine göre sırala
            return foods.sorted { (food1: Food ,food2: Food) -> Bool in
                
                if order == .ascending {
                    // Kolaydan zora: Sayısal değer 1 (Kolay) < 3 (Zor)
                    return food1.dificultlyLevel.comparableValue < food2.dificultlyLevel.comparableValue
                } else {
                    // Zordan kolaya: Sayısal değer 3 (Zor) > 1 (Kolay)
                    return food1.dificultlyLevel.comparableValue > food2.dificultlyLevel.comparableValue
                }
            }
            
        case .cookingTime:
            // Pişirme Süresine göre sırala
            return foods.sorted { (food1: Food , food2: Food) -> Bool in
                if order == .ascending {
                    // Kısa süreden uzuna
                    return food1.cookingTime < food2.cookingTime
                } else {
                    // Uzun süreden kısaya
                    return food1.cookingTime > food2.cookingTime
                }
            }
        }
    }
    

        
}



