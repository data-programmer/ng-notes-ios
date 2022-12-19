//
//  TitleView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/6/21.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("NG Notes")
            .font(.title3)
            .foregroundColor(.white)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
