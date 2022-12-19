//
//  ProjectDetailView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

struct ProjectDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var noteViewModel: NoteViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var project: ProjectModel
    @State private var showCreateNotePopUp = false
    @State private var showDeleteProjectPopUp = false
    var body: some View {
        ZStack {
            ScrollView {
                NoteGridView(columns: columns, noteModels: noteViewModel.projectNotes)
                    .padding(10)
            }
            CreateNoteView(showPopUp: $showCreateNotePopUp, project: $project)
            DeleteProjectView(showPopUp: $showDeleteProjectPopUp, project: $project)
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
                Text(project.name!)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.showDeleteProjectPopUp = true
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.showCreateNotePopUp = true
                }) {
                    Image(systemName: "cross")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
        }
        .onAppear() {
            self.noteViewModel.getProjectNotes(
                userId: self.userViewModel.signedInUser.id ?? 1,
                projectId: self.project.id!)
        }
    }
}


struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(project: ProjectModel(
                            id: 0,
                            name: "Not Here",
                            userId: 0))
            .environmentObject(NoteViewModel())
    }
}
