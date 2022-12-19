//
//  LoginImageView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct LoginImageView: View {
    var body: some View {
        Image(systemName: "note.text")
            .resizable()
            .foregroundColor(.white)
            .frame(
                minWidth: 150,
                idealWidth: 175,
                maxWidth: 200,
                minHeight: 150,
                idealHeight: 175,
                maxHeight: 200,
                alignment: .center
            )
            .padding()
            .padding(.bottom, 10)
    }
}

struct LoginImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginImageView()
    }
}
