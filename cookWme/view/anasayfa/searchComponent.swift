//
//  searchComponent.swift
//  cookWme
//
//  Created by icos on 1.12.2025.
//

import SwiftUI

struct SearchComponent: View {
    
    // '@Binding' değişkeni, HomeView'daki 'searchText' state'ine bağlanır.
        @Binding var searchText: String
        var onCommit: () -> Void = {}
        
        var body: some View {
            HStack {
                // Arama ikonu
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding(.leading, 12)

                // Kullanıcıdan metin girişi alan kısım
                TextField("Tarif veya malzeme ara...", text: $searchText)
                    .padding(.vertical, 12)
                    .padding(.trailing, 12)
                    .onSubmit { // tıklayınca oncommit fonk çalışsın.
                            onCommit()
                    }
                        .submitLabel(.search)
            }
                .frame(height:70)
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2) // Hafif gölge
        }
}

#Preview {
    // @Binding bekleyen View'ları Preview'da göstermek için .constant() kullanırız.
    SearchComponent(searchText: .constant(""),onCommit: { })
            .padding()
}
