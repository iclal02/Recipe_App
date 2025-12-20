//
//  User.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import Foundation

struct User: Identifiable {
    
    let id: UUID = UUID()
    var name: String
    var surname: String
    var email: String
    var password: String
    var prfImage: String?
    
    var favoriEtiketleri: [FavoriEtiket]
}

struct FavoriEtiket: Identifiable {
    let id = UUID()
    var name: String
    var foodIDs: [UUID]      // Etiket içindeki yemek ID’leri
}


