//
//  FavoritesView.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import SwiftUI

struct FavoritesView: View {
    
    @State private var showAddEtiket = false
    @State private var etiketName = ""
    @EnvironmentObject var authVM: AuthViewModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Favori Etiketler")
                            .font(.largeTitle)
                            .bold()
                        
                        Text("Tariflerini gruplandır")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button {
                        showAddEtiket = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.green.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                
                // grid
                if let user = authVM.currentUser {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(user.favoriEtiketleri) { etiket in
                            NavigationLink {
                                EtiketDetailView(etiket: etiket)
                            } label: {
                                VStack(spacing: 12) {
                                    Image(systemName: "tag.fill")
                                        .font(.title)
                                        .foregroundColor(.white.opacity(0.9))
                                    
                                    Text(etiket.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity, minHeight: 120)
                                .background(
                                    LinearGradient(
                                        colors: [Color.green.opacity(0.5), Color.green.opacity(0.3)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .cornerRadius(18)
                                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .sheet(isPresented: $showAddEtiket) {
            yeniEtiketSheet
        }
    }
    
    var yeniEtiketSheet: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("Yeni Etiket")
                    .font(.title)
                    .bold()
                
                TextField("Etiket adı", text: $etiketName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                
                Button("Kaydet") {
                    if !etiketName.isEmpty {
                        authVM.addEtiket(name: etiketName)
                    }
                    etiketName = ""
                    showAddEtiket = false
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Etiket Oluştur")
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium])
    }
}



#Preview {
    FavoritesView()
        .environmentObject(AuthViewModel())
}
