//
//  LoginTextFieldPasswordView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/8/21.
//

import SwiftUI

struct LoginTextFieldPasswordView: View {
    @Binding var password: String
    var body: some View {
        SecureField(
            "Password",
            text: $password,
            onCommit: { print("commit") }
        )
        .cornerRadius(10)
        .padding(.top, 10)
        .padding(.horizontal, 50)
        .font(.title)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .multilineTextAlignment(.center)
    }
}

struct LoginTextFieldPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFieldPasswordView(password: .constant("Password"))
    }
}
