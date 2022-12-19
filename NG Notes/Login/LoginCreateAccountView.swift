//
//  LoginCreateAccountView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct LoginCreateAccountView: View {
    var body: some View {
        HStack {
            Text("Don't have an account?")
                .foregroundColor(.white)
            NavigationLink(destination: SignUpView()) {
                Text("Create Account")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .font(.headline)
        .padding(.top, 45)
        .padding(.bottom, 5)
    }
}

struct LoginCreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        LoginCreateAccountView()
    }
}
