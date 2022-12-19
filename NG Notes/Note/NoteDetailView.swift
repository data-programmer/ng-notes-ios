//
//  NoteDetailView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var noteViewModel: NoteViewModel
    @State private var showDeleteNotePopUp = false
    @State var note: NoteModel
    @State var text: String = ""
    var body: some View {
        ScrollView {
            ZStack {
                TextEditor(text: $text)
                    .padding(10)
                    .frame(height: 750)
                DeleteNoteView(showPopUp: $showDeleteNotePopUp, note: $note)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
            ToolbarItem(placement: .principal) {
                Text(note.title!)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.showDeleteNotePopUp = true
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.note.text = text
                    self.noteViewModel.updateNote(note: self.note)
                }) {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: NoteModel(id: 0, title: "Stuff", date: "Oct 20, 2020", text: "This is a really cool note", userId: 0, projectId: 0), text: "This is a really cool note")
            .environmentObject(NoteViewModel())
    }
}
