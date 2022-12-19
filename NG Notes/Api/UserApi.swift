//
//  UserApi.swift
//  NG Notes
//
//  Created by William Kingsley on 1/6/21.
//

import Foundation

class UserApi {
    
    private let urlBasePath = "https://ngnotesapi.azurewebsites.net/api/user"
    
    func signInUser(username: String, password: String) -> UserModel? {
        let subPath = "/signin/" + username //+ "&" + password // Don't do this in production. Bad idea.
        let path = urlBasePath + subPath
        
        guard let url = URL(string: path) else {
            fatalError("Invalid URL")
        }
        
        var result: UserModel?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                result = try? JSONDecoder().decode(UserModel.self, from: data)
            } else {
                result = nil
            }
            
            semaphore.signal()
            
        }.resume()
        
        _ = semaphore.wait(wallTimeout: .distantFuture)
        
        return result
    }
    
    func registerUser(user: UserModel) -> UserModel? {
        let subPath = "/registeruser"
        let path = urlBasePath + subPath
        
        let jsonData = try? JSONEncoder().encode(user)
        
        guard let url = URL(string: path) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        var result: UserModel?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data, error == nil {
                result = try? JSONDecoder().decode(UserModel.self, from: data)
            } else {
                result = nil
            }
            
            semaphore.signal()
            
        }.resume()
        
        _ = semaphore.wait(wallTimeout: .distantFuture)
        
        return result
    }
    
    func getUser(userId: Int, completion: @escaping (UserModel?) -> ()) {
        let subPath = "/getuser/" + String(userId)
        let path = urlBasePath + subPath
        
        guard let url = URL(string: path) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let user = try? JSONDecoder().decode(UserModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(user)
            }
        }.resume()
    }
    
    func updateUser(user: UserModel, completion: @escaping (UserModel?) -> ()) {
        let subPath = "/updateuser"
        let path = urlBasePath + subPath
        let jsonData = try? JSONEncoder().encode(user)
        guard let url = URL(string: path) else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PUT"
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let user = try? JSONDecoder().decode(UserModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(user)
            }
        }.resume()
    }
    
    func deleteUser(userId: Int, completion: @escaping (UserModel?) -> ()) {
        let subPath = "/deleteuser" + String(userId)
        let path = urlBasePath + subPath
        guard let url = URL(string: path) else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let user = try? JSONDecoder().decode(UserModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(user)
            }
        }.resume()
    }
    
}
