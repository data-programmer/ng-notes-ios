//
//  LoginButtonView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct LoginButtonView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var navigate = false
    @Binding var username: String
    @Binding var password: String
    var body: some View {
        VStack {
            NavigationLink(
                destination: MainView(),
                isActive: $navigate)
                { EmptyView() }
            Button(action: {
                self.userViewModel.signInUser(username: username, password: password)
                self.navigate = true
            }) {
                Text("Sign In")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.title)
            }
            .frame(
                minWidth: 100,
                idealWidth: 150,
                maxWidth: 175,
                minHeight: 25,
                idealHeight: 35,
                maxHeight: 60,
                alignment: .center
            )
        }
        .background(Color(.white))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .cornerRadius(10)
        .padding(.bottom, 50)
        .padding(.top, 25)
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(
            username: .constant(""),
            password: .constant(""))
                .environmentObject(UserViewModel())
    }
}
