//
//  NoteItemView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct NoteItemView: View {
    var title: String = ""
    var date: String = ""
    var text: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0.5) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 20)
                .padding(.leading, 5)
                .padding(.bottom, 5)
            Text(date)
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.leading, 5)
                .padding(.bottom, 5)
            Text(text)
                .foregroundColor(.black)
                .font(.footnote)
                .padding(5)
            Spacer()
        }
        .padding(5)
        .frame(width: 160, height: 160, alignment: .leading)
        .background(Color(.white))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 10)
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteItemView(title: "Somethin", date: "Oct 31, 2020", text: "The beans ar really great in this hotel.")
    }
}
