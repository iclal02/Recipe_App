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
    // '@Published' sayesinde bu dizi değiştiğinde (örn. favori eklendiğinde) arayüz otomatik yenilenir.
    @Published var allFoods: [Food] = FoodData.ornekYemekler
    
    // Ana sayfada gösterilecek sabit kategoriler
    @Published var allCategories: [Categories] = Categories.tumKategoriler
    
    // Kullanıcının kayıtlı bilgisi
    @Published var currentUser: User = User.ornekKullanici
    
    // Favori yemeklerin dinamik listesi (AllFoods'tan filtrelenecek)
    @Published var favoriteFoods: [Food] = []
    
    // Alışveriş listesi öğeleri
    @Published var shoppingList: [ShoppingList] = []
    
    @Published var user: User = .ornekKullanici
    
    @State private var showEtiketPicker = false
    
    
    // MARK: - INITIALIZER (Başlatıcı)
    
    init() {
        // Uygulama ilk açıldığında çalışır.
        loadFavorites()
        loadShoppingList()
        // Kullanıcı bilgisini de yükleyebiliriz (şimdilik statik)
    }
    
    
    // MARK: - FUNCTİONS
    // Kullanıcı bir butona tıkladığında veriyi güncelleyecek fonksiyonlar. Bu, ViewModel'in en temel görevidir.
    
    
    
    
    // MARK: - FAVORITES PAGES
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
    
    // MARK: - SHOPPINGLIST PAGES
    private func loadShoppingList() {
        // İleride kalıcılık eklendiğinde, veriler buradan okunacak.
        // Şimdilik test için boş bir dizi olarak kalabilir.
        shoppingList = []
    }
    
    // Alışveriş listesindeki bir öğenin alındı durumunu değiştirme
    func toggleShoppingItemStatus(item: ShoppingList) {
        if let index = shoppingList.firstIndex(where: { $0.id == item.id }) {
            shoppingList[index].isreceived.toggle()
        }
    }
    
    // alışveris sepetine ekleme
    func addIngredientToShoppingList(ingredient: Ingredient) {
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
            name: itemName,
            amount: amount,
            isreceived: false
        )
        
        shoppingList.append(newItem)
        print("\(newItem.name) sepete eklendi.")
    }
    
    // sepetten çıkarma
    func removeIngredientFromShoppingList(ingredient: Ingredient) {
        // Listedeki aynı isme sahip ürünü bul
        if let index = shoppingList.firstIndex(where: { $0.name.lowercased() == ingredient.name.lowercased() }) {
            shoppingList.remove(at: index)
            print("\(ingredient.name) sepetten çıkarıldı.")
        }
    }
    
    // MARK: - CATEGORY
    // Belirli bir kategoriye ait yemekleri filtreleyen fonksiyon
    func getFoods(for category: Categories) -> [Food] {
        return allFoods.filter { $0.categories == category.name }
    }
    
    // MARK: - DAILYMENU FUNCTION
    // Günün Menüsü için rastgele bir yemek seçer
    func getDailyMenu() -> Food? {
        // Rastgele seçim için 'name' alanı boş olmayanlardan birini seç
        return allFoods.filter { !$0.name.isEmpty }.randomElement()
    }

    // MARK: - PROFILE PAGES
    
    // Profil bilgisini günceller
    func updateProfile(newName: String, newEmail: String) {
        currentUser.name = newName
        currentUser.email = newEmail
        // Şifre güncellemeleri veya daha karmaşık işlemler buraya gelecektir.
    }
    
    // MARK: - SORT FUNCTION
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
    
    
    
    // MARK: - ETİKET
    //  Etiket oluşturma
    func addEtiket(name: String) {
        let yeniEtiket = FavoriEtiket(name: name, foodIDs: [])
        user.favoriEtiketleri.append(yeniEtiket)
    }
    
    //  Yemeği etikete ekle
    func addFoodToEtiket(food: Food, etiket: FavoriEtiket) {
        if let index = user.favoriEtiketleri.firstIndex(where: { $0.id == etiket.id }) {
            if !user.favoriEtiketleri[index].foodIDs.contains(food.id) {
                user.favoriEtiketleri[index].foodIDs.append(food.id)
            }
        }
    }
    
    //  Etiket içindeki yemekleri al
    func foodsForEtiket(_ etiket: FavoriEtiket, allFoods: [Food]) -> [Food] {
        allFoods.filter { etiket.foodIDs.contains($0.id) }
    }
    
        
}



