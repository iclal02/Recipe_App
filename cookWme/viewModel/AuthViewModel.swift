//
//  AuthViewModel.swift
//  cookWme
//
//  Created by icos on 20.12.2025.
//

import Combine
import Foundation


final class AuthViewModel: ObservableObject {

    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User?

    func login(email: String, password: String) {

        // şimdilik fake login
        guard !email.isEmpty, !password.isEmpty else { return }

        // login ile tek user olustur
        currentUser = User(
            name: "İclal",
            surname: "Karahisar",
            email: email,
            password: password,
            prfImage: nil,
            favoriEtiketleri: [
                FavoriEtiket(name: "Hızlı Tarifler", foodIDs: []),
                FavoriEtiket(name: "Yüksek Proteinli", foodIDs: []),
                FavoriEtiket(name: "Vegan", foodIDs: [])
            ]
        )

        isLoggedIn = true
    }

    func logout() {
        isLoggedIn = false
        currentUser = nil
    }
    
    
    // Profil bilgisini günceller
    func updateProfile(newName: String, newEmail: String) {
        currentUser?.name = newName
        currentUser?.email = newEmail
        
    }
    func logoutUser() {
        print("Çıkış yapıldı")
    }
    
    
    // MARK: - ETİKET
    // Etiket oluştur
        func addEtiket(name: String) {
            guard currentUser != nil else { return }

            let yeniEtiket = FavoriEtiket(name: name, foodIDs: [])
            currentUser?.favoriEtiketleri.append(yeniEtiket)
        }

        // Yemeği etikete ekle
        func addFoodToEtiket(food: Food, etiket: FavoriEtiket) {
            guard let index = currentUser?.favoriEtiketleri.firstIndex(where: { $0.id == etiket.id }) else { return }

            if !(currentUser?.favoriEtiketleri[index].foodIDs.contains(food.id) ?? true) {
                currentUser?.favoriEtiketleri[index].foodIDs.append(food.id)
            }
        }

        // Etiket içindeki yemekleri getir
        func foodsForEtiket(_ etiket: FavoriEtiket, allFoods: [Food]) -> [Food] {
            allFoods.filter { etiket.foodIDs.contains($0.id) }
        }
    
}



