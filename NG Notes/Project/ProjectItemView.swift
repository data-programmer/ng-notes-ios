//
//  ProjectItemView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct ProjectItemView: View {
    var title: String = ""
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color("background"))
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 10)
    }
}


struct ProjectItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectItemView(title: "SiteMinder")
    }
}
