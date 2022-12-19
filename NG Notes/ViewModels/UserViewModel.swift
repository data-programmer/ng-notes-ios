//
//  UserViewModel.swift
//  NG Notes
//
//  Created by William Kingsley on 1/5/21.
//

import Combine
import SwiftUI

final class UserViewModel: ObservableObject {
    
    @Published var signedInUser: UserModel = UserModel()
    
    @Published var getUser: UserModel = UserModel()
    
    @Published var registerUser: UserModel = UserModel()
    
    @Published var updatedUser: UserModel = UserModel()
    
    @Published var deletedUser: UserModel = UserModel()
    
    func signInUser(username: String, password: String) {
        let result = UserApi().signInUser(
            username: username,
            password: password
        )
        
        if (result != nil) {
            self.signedInUser = result!
        } else {
            self.signedInUser = UserModel()
        }
    }
    
    func getUser(userId: Int) {
        UserApi().getUser(
            userId: userId,
            completion: { user in
                if let user = user {
                    self.getUser = user
                }
            })
    }
    
    func registerUser(user: UserModel) {
        let result = UserApi().registerUser(user: user)
        
        if (result != nil) {
            self.registerUser = result!
        } else {
            self.registerUser = UserModel()
        }
    }
    
    func updateUser(user: UserModel) {
        UserApi().updateUser(
            user: user,
            completion: { user in
                if let user = user {
                    self.updatedUser = user
                }
            })
    }
    
    func deleteUser(userId: Int) {
        UserApi().deleteUser(
            userId: userId,
            completion: { user in
                if let user = user {
                    self.deletedUser = user
                }
            })
    }
    
}
