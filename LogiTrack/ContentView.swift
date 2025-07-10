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
    @State private var loggedInUserType: UserType? = nil
    @State private var companyID: String? = nil
    @State private var partnerID: String? = nil
    @State private var showSplash = true
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
            } else {
                if isLoggedIn, let userType = loggedInUserType {
                    MainTabView(isLoggedIn: $isLoggedIn, registeredName: registeredName, registeredEmail: registeredEmail, userType: userType, companyID: companyID, partnerID: partnerID)
                } else if isShowingSignup {
                    SignupView(isShowingSignup: $isShowingSignup, registeredEmail: $registeredEmail, registeredPassword: $registeredPassword, registeredName: $registeredName, loggedInUserType: $loggedInUserType, companyID: $companyID, partnerID: $partnerID, isLoggedIn: $isLoggedIn)
                } else {
                    LoginView(isLoggedIn: $isLoggedIn, isShowingSignup: $isShowingSignup, registeredEmail: registeredEmail, registeredPassword: registeredPassword, loggedInUserType: $loggedInUserType, companyID: $companyID, partnerID: $partnerID)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            VStack(spacing: 24) {
                Image(systemName: "shippingbox.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                Text("LogiTrack")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
