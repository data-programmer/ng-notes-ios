//
//  SignUpButtonView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/8/21.
//

import SwiftUI

struct SignUpButtonView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var navigate = false
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    var body: some View {
        VStack {
            NavigationLink(destination: MainView(), isActive: $navigate) { EmptyView() }
            Button(action: {
                if (password == confirmPassword) {
                    self.userViewModel.registerUser(
                        user: UserModel(
                            username: username,
                            password: password,
                            firstName: "",
                            lastName: "")
                    )
                    self.userViewModel.signInUser(
                        username: username,
                        password: password
                    )
                    self.navigate = true
                }
            }) {
                Text("Sign Up")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .frame(
                minWidth: 100,
                idealWidth: 150,
                maxWidth: 175,
                minHeight: 25,
                idealHeight: 35,
                maxHeight: 60,
                alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
            )
        }
        .background(Color(.white))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .cornerRadius(10)
        .padding(.top, 25)
        .padding(.bottom, 50)
    }
}

struct SignUpButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButtonView(
            username: .constant(""),
            password: .constant(""),
            confirmPassword: .constant("")
        ).environmentObject(UserViewModel())
    }
}
