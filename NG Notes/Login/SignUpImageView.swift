//
//  SignUpImageView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/8/21.
//

import SwiftUI

struct SignUpImageView: View {
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
            .padding(.bottom, 5)
    }
}

struct SignUpImageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpImageView()
    }
}
