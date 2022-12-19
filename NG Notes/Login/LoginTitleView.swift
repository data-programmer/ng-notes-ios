//
//  LoginTitleView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct LoginTitleView: View {
    var body: some View {
        Text("Sign In")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .padding()
    }
}

struct LoginTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTitleView()
    }
}
