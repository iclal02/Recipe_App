//
//  EditProfileView.swift
//  cookWme
//
//  Created by icos on 17.12.2025.
//


import SwiftUI

struct EditProfileView: View {
    
    @EnvironmentObject var dataService: FoodDataService
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var surname = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Kişisel Bilgiler")) {
                    TextField("Ad", text: $name)
                    TextField("Soyad", text: $surname)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }
            }
            .navigationTitle("Bilgileri Düzenle")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        dataService.user.name = name
                        dataService.user.surname = surname
                        dataService.user.email = email
                        dismiss()
                    }
                }
            }
            .onAppear {
                name = dataService.user.name
                surname = dataService.user.surname
                email = dataService.user.email
            }
        }
    }
}


#Preview {
    EditProfileView()
        .environmentObject(FoodDataService())
}
