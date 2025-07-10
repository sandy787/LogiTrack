//
//  ContentView.swift
//  LogiTrack
//
//  Created by prajwal sanap on 09/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var isShowingSignup = false
    @State private var registeredEmail: String? = nil
    @State private var registeredPassword: String? = nil
    @State private var registeredName: String? = nil
    var body: some View {
        if isLoggedIn {
            MainTabView(isLoggedIn: $isLoggedIn, registeredName: registeredName, registeredEmail: registeredEmail)
        } else if isShowingSignup {
            SignupView(isShowingSignup: $isShowingSignup, registeredEmail: $registeredEmail, registeredPassword: $registeredPassword, registeredName: $registeredName)
        } else {
            LoginView(isLoggedIn: $isLoggedIn, isShowingSignup: $isShowingSignup, registeredEmail: registeredEmail, registeredPassword: registeredPassword)
        }
    }
}

#Preview {
    ContentView()
}
