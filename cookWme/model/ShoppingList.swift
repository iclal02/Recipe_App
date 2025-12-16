//
//  ShoppingList.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import Foundation

struct ShoppingList: Identifiable {
    
    let id: UUID=UUID()
    var name: String
    var amount: String // miktar
    let recipeName: String
    var isreceived : Bool=false // alınıp alınmama durumu
}
