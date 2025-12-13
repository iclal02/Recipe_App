//
//  FavoritesView.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var dataService: FoodDataService
    @State private var showAddEtiket = false
    @State private var etiketName = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Text("Favori Etiketler")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button(action: { showAddEtiket = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.orange)
                    }
                }
                .padding(.horizontal)
                
                // FAVORI ETIKETLER GRID
                let columns = [GridItem(.flexible()), GridItem(.flexible())]
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(dataService.user.favoriEtiketleri) { etiket in
                        NavigationLink {
                            EtiketDetailView(etiket: etiket)
                        } label: {
                            VStack {
                                Text(etiket.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity, minHeight: 120)
                            .background(.gray.opacity(0.75))
                            .cornerRadius(16)
                            .shadow(radius: 5)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $showAddEtiket) {
            yeniEtiketSheet
        }
    }
    
    var yeniEtiketSheet: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Yeni Etiket Oluştur")
                    .font(.title2)
                    .bold()
                
                TextField("Etiket Adı", text: $etiketName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Button("Kaydet") {
                    if !etiketName.isEmpty {
                        dataService.addEtiket(name: etiketName)
                    }
                    showAddEtiket = false
                    etiketName = ""
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    FavoritesView()
}
