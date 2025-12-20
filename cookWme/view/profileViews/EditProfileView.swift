//
//  EditProfileView.swift
//  cookWme
//
//  Created by icos on 17.12.2025.
//


import SwiftUI

struct EditProfileView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
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
                        authVM.currentUser?.name = name
                        authVM.currentUser?.surname = surname
                        authVM.currentUser?.email = email

                        dismiss()
                    }
                }
            }
            .onAppear {
                if let user = authVM.currentUser {
                        name = user.name
                        surname = user.surname
                        email = user.email
                }
            }
        }
    }
}


#Preview {
    EditProfileView()
        .environmentObject(FoodDataService())
        .environmentObject(AuthViewModel())
}
