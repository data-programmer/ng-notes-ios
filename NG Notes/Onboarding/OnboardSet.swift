//
//  OnboardSet.swift
//  NG Notes
//
//  Created by William Kingsley on 12/23/20.
//

import UIKit

class OnboardSet {
    private(set) var cards: [OnboardCard] = []
    private(set) var width: CGFloat = 350
    private(set) var height: CGFloat = 450
    
    func dimensions(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func newCard(title: String, image: String, text: String) {
        cards.append(OnboardCard(title: title, image: image, text: text))
    }
}

extension OnboardSet {
    static func previewSet() -> OnboardSet {
        let onboardSet = OnboardSet()
        onboardSet.newCard(
            title: "NG Notes",
            image: "note.text",
            text: "NG Notes is a note taking application made to help you categorize and organize important work information"
        )
        onboardSet.newCard(
            title: "Projects",
            image: "airplane",
            text: "Projects are containers that are used to organize your notes. To create a note, you first need to create a project"
        )
        onboardSet.newCard(
            title: "Notes",
            image: "pencil",
            text: "Notes are used to stored information that you want saved in text format. Create a note to help you keep track of work tasks"
        )
        onboardSet.newCard(
            title: "Create Account",
            image: "at.badge.plus",
            text: "Don't have an account? No problem. Get started creating an account by pressing the \"Create Account\" text below"
        )
        return onboardSet
    }
}


