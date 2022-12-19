//
//  LoginView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/24/20.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showOnBoarding = false
    @AppStorage("OnboardViewed") var hasOnboarded = false
    var onboardSet = OnboardData.buildSet(width: 350, height: 450)
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").ignoresSafeArea()
                VStack {
                    LoginImageView()
                    LoginTextView()
                    LoginTextFieldView(username: $username)
                    LoginTextFieldPasswordView(password: $password)
                    LoginButtonView(username: $username, password: $password)
                    LoginCreateAccountView()
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .disabled(showOnBoarding)
                .blur(radius: showOnBoarding ? 5.0 : 0)
                if showOnBoarding {
                    OnboardingScreens(
                        isPresenting: $showOnBoarding,
                        onboardSet: onboardSet
                    )
                }
            }
            .onAppear {
                hasOnboarded = false // for testing only
                if !hasOnboarded {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            showOnBoarding.toggle()
                            hasOnboarded = true
                        }
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
