//
//  Categories.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import Foundation

struct Categories: Identifiable{
    
    let id: UUID = UUID()
    var name: String
    var image: String
    
}


extension Categories {
    static let tumKategoriler: [Categories] = [
        Categories(name: "Çorba", image: "takeoutbag.and.cup.and.straw"),
        Categories(name: "Kahvaltı", image: "kahvaltı"),
        Categories(name: "Öğle Yemeği", image: "ogle.yemegı"),
        Categories(name: "Akşam Yemeği", image: "aksam.yemegı"),
        Categories(name: "Tatlı", image: "tatlı"),
        Categories(name: "Atıştırmalık", image: "atıstırmalık")
    ]
}
