//
//  DeleteView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/30/20.
//

import SwiftUI

struct DeleteNoteView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    //@Binding var projectId: Int
    @Binding var showPopUp: Bool
    @Binding var note: NoteModel
    @EnvironmentObject var noteViewModel: NoteViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        ZStack {
            if $showPopUp.wrappedValue {
                ZStack {
                    Color.white
                    VStack {
                        Text("Delete Note")
                            .font(.title2)
                        Spacer()
                        HStack {
                            HStack {
                                Text("Delete")
                                Text("\(note.title!)?")
                            }
                        }
                        .padding()
                        .font(.title3)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                        HStack {
                            Button(action: {
                                self.showPopUp = false
                            }) {
                                Text("Close")
                            }.padding()
                            Spacer()
                            Button(action: {
                                self.noteViewModel.deleteNote(noteId: self.note.id!)
                                self.noteViewModel.getRecentNotes(userId: self.userViewModel.signedInUser.id ?? 1)
                                self.showPopUp = false
                                self.mode.wrappedValue.dismiss()
                            }) {
                                Text("Delete")
                            }
                            .padding()
                        }
                    }
                    .padding()
                }
                .frame(width: 300, height: 250)
                .cornerRadius(20).shadow(radius: 20)
            }
        }
        .padding()
    }
}

struct DeleteNoteView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteNoteView(
            showPopUp: .constant(true),
            note: .constant(NoteModel(id: 0, title: "Unknown", date: "", text: "", userId: 0, projectId: 0))
        ).environmentObject(NoteViewModel())
    }
}

