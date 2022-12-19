//
//  NoteListView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/27/20.
//

import SwiftUI
import Combine
import Foundation

struct NoteListView: View {
    @EnvironmentObject var noteViewModel: NoteViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            if (self.noteViewModel.recentNotes.isEmpty) {
                Text("No recent notes to display")
                    .padding(45)
            } else {
                NoteGridView(columns: columns, noteModels: noteViewModel.recentNotes)
            }
        }
        .onAppear() {
            self.noteViewModel.getRecentNotes(
                userId: userViewModel.signedInUser.id ?? 1
            )
        }
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
            .environmentObject(NoteViewModel())
            .environmentObject(UserViewModel())
    }
}
