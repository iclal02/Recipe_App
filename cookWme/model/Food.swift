//
//  Food.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import Foundation

struct Food: Identifiable{
    
    let id : UUID = UUID()
    var imageName: String = ""
    var name: String
    var cookingTime: Int
    var dificultlyLevel: Level
    var ingredients: [Ingredient]
    var recipe: [String]
    var categories: String // bizim olusturdugumuz kategoriler
    var isFavorite: Bool = false
    
}

struct Ingredient: Identifiable {
    let id: UUID = UUID()
    var name: String // örn: "250g kıyma"
    var isChecked: Bool = false // Sepete eklenip eklenmediği
}

enum Level: String, CaseIterable{
    case easy = "Kolay"
    case medium = "Orta"
    case hard = "Zor"
    
    var id: String { self.rawValue }
    
// sıralama yapabilmek icin kullanıcaz
var comparableValue: Int {
        switch self {
        case .easy : return 1
        case .medium: return 2
        case .hard: return 3
        }
    }
}

let foods = FoodData.ornekYemekler

