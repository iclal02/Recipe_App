//
//  ProfileView.swift
//  cookWme
//
//  Created by icos on 30.11.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var dataService: FoodDataService
    @State private var showEditProfile = false
    @State private var showLogoutAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                
                // MARK: - HEADER
                VStack(spacing: 12) {
                    
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 90))
                        .foregroundColor(.secondary)
                    
                    Text("\(dataService.user.name) \(dataService.user.surname)")
                        .font(.title2)
                        .bold()
                    
                    Text(dataService.user.email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 40)
                
                // MARK: - ACTIONS
                VStack(spacing: 0) {
                    
                    profileRow(
                        icon: "pencil",
                        title: "Bilgileri Düzenle"
                    ) {
                        showEditProfile = true
                    }
                    
                    Divider()
                    
                    profileRow(
                        icon: "arrow.right.square",
                        title: "Çıkış Yap",
                        isDestructive: true
                    ) {
                        showLogoutAlert = true
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .padding(.horizontal)
            }
        }
        .navigationTitle("Profil")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showEditProfile) {
            EditProfileView()
                .environmentObject(dataService)
        }
        .alert("Çıkış Yap", isPresented: $showLogoutAlert) {
            Button("İptal", role: .cancel) {}
            Button("Çıkış Yap", role: .destructive) {
                dataService.logoutUser()
            }
        } message: {
            Text("Hesabınızdan çıkış yapmak istediğinize emin misiniz?")
        }
    }
    
    // MARK: - ROW
    private func profileRow(
        icon: String,
        title: String,
        isDestructive: Bool = false,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .foregroundColor(isDestructive ? .red : .primary)
                
                Text(title)
                    .foregroundColor(isDestructive ? .red : .primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 14)
        }
    }
}


#Preview {
    ProfileView()
        .environmentObject(FoodDataService())
}
