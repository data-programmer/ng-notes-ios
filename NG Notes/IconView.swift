//
//  IconView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/6/21.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        Image(systemName: "note.text")
            .font(.title2)
            .foregroundColor(.white)
            .foregroundColor(.white)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
