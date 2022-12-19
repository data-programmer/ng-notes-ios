//
//  ContentView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/23/20.
//

import SwiftUI

struct MainView: View {
    @State private var showCreateProjectPopUp = false
    var body: some View {
        ZStack {
            VStack {
                ProjectTitleView()
                ProjectListView()
                RecentTitleView()
                NoteListView()
            }
            CreateProjectView(showPopUp: $showCreateProjectPopUp)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                IconView()
            }
            ToolbarItem(placement: .navigationBarLeading) {
                TitleView()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                UsernameView()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.showCreateProjectPopUp = true
                }) {
                    Image(systemName: "cross")
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
