//
//  ContentView.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dataService: FoodDataService
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                HomeScreenView()
            }
                .tabItem {
                    Label("Ana Sayfa", systemImage: "house")
                }
            
            NavigationView {
                FavoritesView()
            }
                .tabItem {
                    Label("Favoriler", systemImage: "star")
                }
            
            
            NavigationView {
                ShoppingListView()
            }
                .tabItem {
                    Label("Sepetim", systemImage: "cart")
                }
            
            NavigationView {
                ProfileView()
            }
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
            
        }
     
        
        
    }
}

#Preview {
    ContentView()
        .environmentObject(FoodDataService())
}
