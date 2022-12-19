//
//  DeleteView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/30/20.
//

import SwiftUI

struct CreateNoteView: View {
    @Binding var showPopUp: Bool
    @State var name = ""
    @Binding var project: ProjectModel
    @EnvironmentObject var noteViewModel: NoteViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        ZStack {
            if $showPopUp.wrappedValue {
                ZStack {
                    Color.white
                    VStack {
                        Text("Create New Note")
                            .font(.title2)
                        Spacer()
                        VStack {
                            HStack {
                                Text("Note Name")
                                Spacer()
                            }
                            TextField(
                            "New note name",
                            text: $name
                            )
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
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateStyle = .medium
                                dateFormatter.timeStyle = .none
                                dateFormatter.locale = Locale(identifier: "en_US")
                                
                                let currentDate = Date()
                                
                                self.noteViewModel.createNote(
                                    note: NoteModel(
                                        title: self.name,
                                        date: dateFormatter.string(from: currentDate),
                                        text: "",
                                        userId: self.userViewModel.signedInUser.id ?? 1,
                                        projectId: self.project.id
                                    )
                                )
                                self.name = ""
                                self.showPopUp = false
                            }) {
                                Text("Save")
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

struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView(
            showPopUp: .constant(true),
            project: .constant(ProjectModel(id: 0, name: "Unknown", userId: 0))
        ).environmentObject(NoteViewModel())
    }
}

