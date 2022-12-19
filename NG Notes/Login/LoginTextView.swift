//
//  LoginTextView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct LoginTextView: View {
    var body: some View {
        Text("Welcome to NG Notes")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .padding()
            .padding(.bottom, 20)
    }
}

struct LoginTextView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextView()
    }
}
