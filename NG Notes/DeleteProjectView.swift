//
//  DeleteView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/30/20.
//

import SwiftUI

struct DeleteProjectView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var showPopUp: Bool
    @Binding var project: ProjectModel
    @EnvironmentObject var noteViewModel: NoteViewModel
    @EnvironmentObject var projectViewModel: ProjectViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        ZStack {
            if $showPopUp.wrappedValue {
                ZStack {
                    Color.white
                    VStack {
                        Text("Delete Project")
                            .font(.title2)
                        Spacer()
                        HStack {
                            HStack {
                                Text("Delete")
                                Text("\(self.project.name!)?")
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
                                self.projectViewModel.deleteProject(projectId: self.project.id!)
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

struct DeleteProjectView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteProjectView(
            showPopUp: .constant(true),
            project: .constant(ProjectModel(id: 0, name: "Unknown", userId: 0))
        )
        .environmentObject(ProjectViewModel())
        .environmentObject(NoteViewModel())
        .environmentObject(UserViewModel())
    }
}
