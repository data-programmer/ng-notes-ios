//
//  ProjectApi.swift
//  NG Notes
//
//  Created by William Kingsley on 1/6/21.
//

import Foundation

class ProjectApi {
    
    private let urlBasePath = "https://ngnotesapi.azurewebsites.net/api/project"
    
    func fetchAllProjects(userId: Int, completion: @escaping ([ProjectModel]?) -> ()) {
        let subPath = "/getallprojects/" + String(userId)
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
            
            let allProjects = try? JSONDecoder().decode([ProjectModel].self, from: data)
            
            DispatchQueue.main.async {
                completion(allProjects)
            }
        }.resume()
    }

    func createProject(project: ProjectModel, completion: @escaping (ProjectModel?) -> ()) {
        let subPath = "/createproject"
        let path = urlBasePath + subPath
        let jsonData = try? JSONEncoder().encode(project)
        guard let url = URL(string: path) else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let project = try? JSONDecoder().decode(ProjectModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(project)
            }
        }.resume()
    }

    func updateProject(project: ProjectModel, completion: @escaping (ProjectModel?) -> ()) {
        let subPath = "/updateproject"
        let path = urlBasePath + subPath
        let jsonData = try? JSONEncoder().encode(project)
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
            
            let project = try? JSONDecoder().decode(ProjectModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(project)
            }
        }.resume()
    }

    func deleteProject(projectId: Int) -> ProjectModel? {
        let subPath = "/deleteproject/" + String(projectId)
        let path = urlBasePath + subPath
        guard let url = URL(string: path) else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        
        var result: ProjectModel?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, error == nil {
                result = try? JSONDecoder().decode(ProjectModel.self, from: data)
            } else {
                result = nil
            }
            
            semaphore.signal()
            
        }.resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        return result
    }

}
