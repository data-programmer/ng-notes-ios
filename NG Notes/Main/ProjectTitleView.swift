//
//  ProjectTitleView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct ProjectTitleView: View {
    var body: some View {
        HStack {
            Text("Projects")
                .foregroundColor(.black)
                .padding(.top, 10)
                .padding(.horizontal, 15)
                .font(.title2)
            Spacer()
        }
    }
}

struct ProjectTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTitleView()
    }
}
