//
//  ShoppingListView.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import SwiftUI

struct ShoppingListView: View {
    
    @EnvironmentObject var dataService: FoodDataService
    
    var groupedByRecipe: [String: [ShoppingList]] {
        Dictionary(grouping: dataService.shoppingList) {
            $0.recipeName
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(groupedByRecipe.keys.sorted(), id: \.self) { recipeName in
                    let items = groupedByRecipe[recipeName]!
                    Section {
                        ForEach(groupedByRecipe[recipeName]!) { item in
                            HStack {
                                Text(" \(item.name)") 
                                    .strikethrough(item.isreceived)
                                
                                Spacer()
                                
                                Image(systemName: item.isreceived ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isreceived ? .green : .gray)
                                    .onTapGesture {
                                        dataService.toggleShoppingItemStatus(item: item)
                                    }
                            }
                        }
                        .onDelete { offsets in
                            dataService.deleteShoppingItems(at: offsets, in:items )
                               }
                    } header: {
                        Text(recipeName)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Alışveriş Listesi")
        }
    }
}


#Preview {
    ShoppingListView()
        .environmentObject(FoodDataService())
}
