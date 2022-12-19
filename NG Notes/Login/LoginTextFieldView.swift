//
//  LoginTextFieldView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct LoginTextFieldView: View {
    @Binding var username: String
    var body: some View {
        TextField(
            "Username",
            text: $username,
            onCommit: { print("commit") }
        )
        .cornerRadius(10)
        .padding(.top, 10)
        .padding(.bottom, 5)
        .padding(.horizontal, 50)
        .font(.title)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .multilineTextAlignment(.center)
    }
}

struct LoginTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFieldView(username: .constant("William"))
    }
}
