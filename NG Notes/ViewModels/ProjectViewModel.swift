//
//  ProjectViewModel.swift
//  NG Notes
//
//  Created by William Kingsley on 1/5/21.
//

import Combine
import SwiftUI

final class ProjectViewModel: ObservableObject {
    
    @Published var allProjects: [ProjectModel] = []
    
    @Published var createdProject: ProjectModel = ProjectModel()
    
    @Published var updatedProject: ProjectModel = ProjectModel()
    
    @Published var deletedProject: ProjectModel = ProjectModel()
    
    func getAllProjects(userId: Int) {
        ProjectApi().fetchAllProjects(
            userId: userId,
            completion: { projects in
                if let projects = projects {
                    self.allProjects = projects
                }
            })
    }
    
    func createProject(project: ProjectModel) {
        ProjectApi().createProject(
            project: project,
            completion: { project in
                if let project = project {
                    self.createdProject = project
                    self.allProjects += [project]
                }
            })
    }
    
    func updateProject(project: ProjectModel) {
        ProjectApi().updateProject(
            project: project,
            completion: { project in
                if let project = project {
                    self.updatedProject = project
                }
            })
    }
    
    func deleteProject(projectId: Int) {
        let result = ProjectApi().deleteProject(projectId: projectId)
        
        if (result != nil) {
            self.deletedProject = result!
            if let index = self.allProjects.firstIndex(of: self.deletedProject) {
                self.allProjects.remove(at: index)
            }
        }
    }
    
}
