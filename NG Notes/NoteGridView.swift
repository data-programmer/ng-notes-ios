//
//  NoteGridView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/28/20.
//
//
import SwiftUI

struct NoteGridView: View {
    var columns: [GridItem]
    var noteModels: [NoteModel]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(noteModels) { note in
                NavigationLink(destination: NoteDetailView(note: note, text: note.text!)) {
                    NoteItemView(title: note.title!, date: note.date!, text: note.text!)
                        .padding(.top, 0)
                        .padding(.bottom, 2)
                }
            }
        }
        .padding(.top, 5)
        .padding(.horizontal)
        .padding(.bottom, 0)
    }
}

struct NoteGridView_Previews: PreviewProvider {
    static var previews: some View {
        NoteGridView(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], noteModels: NoteItems().demoRecentNoteList)
    }
}
