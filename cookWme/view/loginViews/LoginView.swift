//
//  LoginView.swift
//  cookWme
//
//  Created by icos on 20.12.2025.
//


import SwiftUI

struct LoginView: View {

    @EnvironmentObject var authVM: AuthViewModel

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 32) {

            Spacer()

            // MARK: - logo
            VStack(spacing: 12) {
                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundStyle(.orange)

                Text("cookWme")
                    .font(.largeTitle)
                    .bold()

                Text("Lezzetli tarifler cebinde 🍳")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            // MARK: - giriş
            VStack(spacing: 16) {

                inputField(
                    icon: "envelope",
                    placeholder: "E-posta",
                    text: $email,
                    isSecure: false
                )

                inputField(
                    icon: "lock",
                    placeholder: "Şifre",
                    text: $password,
                    isSecure: true
                )
            }

            // MARK: - buton
            Button {
                authVM.login(email: email, password: password)
            } label: {
                Text("Giriş Yap")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.orange, .red],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.2), radius: 6, y: 4)
            }
            .disabled(email.isEmpty || password.isEmpty)
            .opacity(email.isEmpty || password.isEmpty ? 0.6 : 1)

            Spacer()
        }
        .padding(.horizontal, 24)
    }

    
    @ViewBuilder
    private func inputField(
        icon: String,
        placeholder: String,
        text: Binding<String>,
        isSecure: Bool
    ) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.secondary)

            if isSecure {
                SecureField(placeholder, text: text)
            } else {
                TextField(placeholder, text: text)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(14)
    }
}


#Preview {
    LoginView( )
        .environmentObject(AuthViewModel())
}
