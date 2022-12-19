//
//  RecentTitleView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct RecentTitleView: View {
    var body: some View {
        HStack {
            Text("Recent")
                .foregroundColor(.black)
                .padding(.top, 0)
                .padding(.horizontal, 15)
                .font(.title2)
            Spacer()
        }
    }
}

struct RecentTitleView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTitleView()
    }
}
