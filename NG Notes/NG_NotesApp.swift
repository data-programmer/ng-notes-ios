//
//  NG_NotesApp.swift
//  NG Notes
//
//  Created by William Kingsley on 12/23/20.
//

import SwiftUI

@main
struct NG_NotesApp: App {
    @StateObject var userViewModel = UserViewModel()
    @StateObject var projectViewModel = ProjectViewModel()
    @StateObject var noteViewModel = NoteViewModel()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(userViewModel)
                .environmentObject(projectViewModel)
                .environmentObject(noteViewModel)
        }
    }
}
