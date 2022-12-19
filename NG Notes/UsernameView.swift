//
//  UsernameView.swift
//  NG Notes
//
//  Created by William Kingsley on 1/6/21.
//

import SwiftUI

struct UsernameView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        Text(self.userViewModel.signedInUser.username ?? "Unknown")
            .font(.title3)
            .foregroundColor(.white)
            .onAppear() {
                self.userViewModel.getUser(
                    userId: self.userViewModel.signedInUser.id ?? 1
                )
            }
    }
}

struct UsernameView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameView()
            .environmentObject(UserViewModel())
    }
}
