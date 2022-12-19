//
//  SignUpTextView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/8/21.
//

import SwiftUI

struct SignUpTextView: View {
    var body: some View {
        Text("Sign up to access NG Notes")
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .padding(.bottom, 15)
    }
}

struct SignUpTextView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextView()
    }
}
