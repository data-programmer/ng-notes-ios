//
//  NoteViewModel.swift
//  NG Notes
//
//  Created by William Kingsley on 1/5/21.
//

import Combine
import SwiftUI

final class NoteViewModel: ObservableObject {
    
    @Published var recentNotes = [NoteModel]()
    
    @Published var projectNotes = [NoteModel]()
    
    @Published var createdNote = NoteModel()
    
    @Published var updatedNote = NoteModel()
    
    @Published var deletedNote = NoteModel()
    
    func getRecentNotes(userId: Int) {
        NoteApi().fetchRecentNotes(
            userId: userId,
            completion: { notes in
                if let notes = notes {
                    self.recentNotes = notes
                }
            })
    }
    
    func getProjectNotes(userId: Int, projectId: Int) {
        NoteApi().fetchAllProjectNotes(
            UserId: userId,
            ProjectId: projectId,
            completion: { notes in
                if let notes = notes {
                    self.projectNotes = notes
                }
            })
    }
    
    func createNote(note: NoteModel) {
        NoteApi().createNote(
            note: note,
            completion: { note in
                if let note = note {
                    self.createdNote = note
                    self.projectNotes += [note]
                }
            })
    }
    
    func updateNote(note: NoteModel) {
        NoteApi().updateNote(
            note: note,
            completion: { note in
                if let note = note {
                    self.updatedNote = note
                }
            })
    }
    
    func deleteNote(noteId: Int) {
        NoteApi().deleteNote(
            noteId: noteId,
            completion: { note in
                if let note = note {
                    self.deletedNote = note
                    if let index = self.projectNotes.firstIndex(of: note) {
                        self.projectNotes.remove(at: index)
                    }
                    if let index = self.recentNotes.firstIndex(of: note) {
                        self.recentNotes.remove(at: index)
                    }
                }
            })
    }

}
