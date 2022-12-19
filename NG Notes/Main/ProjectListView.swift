//
//  ProjectListView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/27/20.
//

import SwiftUI

struct ProjectListView: View {
    @EnvironmentObject var projectViewModel: ProjectViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        ScrollView {
            if (self.projectViewModel.allProjects.isEmpty) {
                Text("No projects to display")
                    .padding(45)
            } else {
                ForEach(self.projectViewModel.allProjects, id: \.id) { project in
                    NavigationLink(destination: ProjectDetailView(project: project)) {
                        ProjectItemView(title: project.name!)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 50)
                    }
                }
            }
        }
        .onAppear() {
            self.projectViewModel.getAllProjects(
                userId: self.userViewModel.signedInUser.id ?? 1
            )
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
            .environmentObject(ProjectViewModel())
            .environmentObject(UserViewModel())
    }
}
