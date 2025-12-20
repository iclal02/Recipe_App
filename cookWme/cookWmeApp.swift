//
//  cookWmeApp.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import SwiftUI

@main
struct cookWmeApp: App {
    
    // Uygulamanın en tepesinde, Veri Yöneticimizin tek bir örneğini oluşturuyoruz.
    // '@StateObject' bu örneği uygulamanın hafızasında tutar ve View'lar yenilense bile kaybolmasını engeller.
    @StateObject var dataService = FoodDataService()
    @StateObject var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(dataService)
                .environmentObject(authVM)
        }
    }
}
