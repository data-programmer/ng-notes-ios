//
//  NoteApi.swift
//  NG Notes
//
//  Created by William Kingsley on 1/6/21.
//

import Foundation

class NoteApi {
    
    private let urlBasePath = "https://ngnotesapi.azurewebsites.net/api/note"
    
    func fetchRecentNotes(userId: Int, completion: @escaping ([NoteModel]?) -> ()) {
        let subPath = "/getallrecentnotes/" + String(userId)
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
            
            let recentNotes = try? JSONDecoder().decode([NoteModel].self, from: data)
            
            DispatchQueue.main.async {
                completion(recentNotes)
            }
        }.resume()
    }
    
    func fetchAllProjectNotes(UserId: Int, ProjectId: Int, completion: @escaping ([NoteModel]?) -> ()) {
        let subPath = "/getallnotes/" + String(UserId) + "&" + String(ProjectId)
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
            
            let notes = try? JSONDecoder().decode([NoteModel].self, from: data)
            
            DispatchQueue.main.async {
                completion(notes)
            }
        }.resume()
    }
    
    func createNote(note: NoteModel, completion: @escaping (NoteModel?) -> ()) {
        let subPath = "/createnote"
        let path = urlBasePath + subPath
        let jsonData = try? JSONEncoder().encode(note)
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
            
            let note = try? JSONDecoder().decode(NoteModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(note)
            }
        }.resume()
    }
    
    func updateNote(note: NoteModel, completion: @escaping (NoteModel?) -> ()) {
        let subPath = "/updatenote"
        let path = urlBasePath + subPath
        let jsonData = try? JSONEncoder().encode(note)
        
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
            
            let note = try? JSONDecoder().decode(NoteModel.self, from: data)
            
            DispatchQueue.main.async {
                completion(note)
            }
        }.resume()
    }
    
//    func deleteNote(noteId: Int) -> NoteModel? {
//        let subPath = "/deletenote/" + String(noteId)
//        let path = urlBasePath + subPath
//        guard let url = URL(string: path) else {
//            fatalError("Invalid URL")
//        }
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "DELETE"
//
//        var result: NoteModel?
//
//        let semaphore = DispatchSemaphore(value: 0)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data, error == nil {
//                result = try? JSONDecoder().decode(NoteModel.self, from: data)
//            } else {
//                result = nil
//            }
//
//            semaphore.signal()
//
//        }.resume()
//
//        _ = semaphore.wait(wallTimeout: .distantFuture)
//
//        return result
//    }
    
    func deleteNote(noteId: Int, completion: @escaping (NoteModel?) -> ()) {
        let subPath = "/deletenote/" + String(noteId)
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

            let note = try? JSONDecoder().decode(NoteModel.self, from: data)

            DispatchQueue.main.async {
                completion(note)
            }
        }.resume()
    }
    
}
