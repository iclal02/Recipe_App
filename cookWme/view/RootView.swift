//
//  RootView.swift
//  cookWme
//
//  Created by icos on 20.12.2025.
//

import SwiftUI


struct RootView: View {

    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        if authVM.isLoggedIn {
            ContentView()
        } else {
            LoginView()
        }
    }
}
