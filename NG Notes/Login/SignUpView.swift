//
//  SignUpView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/8/21.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            VStack {
                SignUpImageView()
                SignUpTextView()
                SignUpTextFieldView(
                    username: $username,
                    password: $password,
                    confirmPassword: $confirmPassword
                )
                SignUpButtonView(
                    username: $username,
                    password: $password,
                    confirmPassword: $confirmPassword
                )
                Spacer()
            }
        }
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
