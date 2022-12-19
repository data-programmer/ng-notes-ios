//
//  DeleteView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/30/20.
//

import SwiftUI

struct CreateProjectView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var projectViewModel: ProjectViewModel
    @Binding var showPopUp: Bool
    @State var name = ""
    var body: some View {
        ZStack {
            if $showPopUp.wrappedValue {
                ZStack {
                    Color.white
                    VStack {
                        Text("Create New Project")
                            .font(.title2)
                        Spacer()
                        VStack {
                            HStack {
                                Text("Project Name")
                                Spacer()
                            }
                            TextField(
                            "New project name",
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
                                self.projectViewModel.createProject(
                                    project: ProjectModel(
                                        name: self.name,
                                        userId:
                                            self.userViewModel.signedInUser.id ?? 1
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

struct CreateProject_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView(
            showPopUp: .constant(true)
        )
        .environmentObject(ProjectViewModel())
        .environmentObject(UserViewModel())
    }
}
