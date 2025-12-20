//
//  SearchFoodView.swift
//  cookWme
//
//  Created by icos on 6.12.2025.
//


import SwiftUI

struct SearchFoodView: View {
    
    @EnvironmentObject var dataService: FoodDataService
    @State private var searchText: String = ""
    @State private var navigate: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                TextField("Yemek ara…", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                Button("Ara") {
                    navigate = true
                }
                .buttonStyle(.borderedProminent)
                
                // BURASI YÖNLENDİRİYOR
                NavigationLink(
                    destination: SearchResultView(query: searchText)
                        .environmentObject(dataService),
                    isActive: $navigate
                ) { EmptyView() }
                
                
                Spacer()
            }
            .navigationTitle("Yemek Ara")
        }
    }
}
#Preview {
    
    SearchFoodView()
        .environmentObject(FoodDataService())
}
