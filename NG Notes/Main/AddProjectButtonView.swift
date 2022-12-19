//
//  AddProjectButtonView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct AddProjectButtonView: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                
            }) {
                HStack {
                    Text("+")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }.frame(
                    minWidth: 20,
                    idealWidth: 25,
                    maxWidth: 50,
                    minHeight: 20,
                    idealHeight: 25,
                    maxHeight: 50,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                )
                .background(Color(.orange))
            }
            .cornerRadius(50)
            .padding()
        }
    }
}

struct AddProjectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectButtonView()
    }
}
