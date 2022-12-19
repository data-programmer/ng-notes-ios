//
//  SignUpTextFieldView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/8/21.
//

import SwiftUI

struct SignUpTextFieldView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    var body: some View {
        VStack {
            TextField(
                "Username",
                text: $username,
                onCommit: { print("commit") }
            )
            .cornerRadius(10)
            .padding(.top, 15)
            .padding(.horizontal, 50)
            .font(.title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            TextField(
                "Password",
                text: $password,
                onCommit: { print("commit") }
            )
            .cornerRadius(10)
            .padding(.top, 25)
            .padding(.horizontal, 50)
            .font(.title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            TextField(
                "Confirm Password",
                text: $confirmPassword,
                onCommit: { print("commit") }
            )
            .cornerRadius(10)
            .padding(.top, 25)
            .padding(.horizontal, 50)
            .font(.title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
        }
    }
}

struct SignUpTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextFieldView(
            username: .constant(""),
            password: .constant(""),
            confirmPassword: .constant(""))
    }
}
