//
//  SortCriteria.swift
//  cookWme
//
//  Created by icos on 3.12.2025.
//


import Foundation


enum SortCriteria: String, CaseIterable, Identifiable {
    case none = "Önerilen"
    case difficulty = "Zorluk Derecesi"
    case cookingTime = "Pişirme Süresi"
    
    var id: String { self.rawValue }
}


enum SortOrder: String, CaseIterable, Identifiable {
    case ascending = "Artan (En Kolay/Kısa)"
    case descending = "Azalan (En Zor/Uzun)"
    
    var id: String { self.rawValue }
}
