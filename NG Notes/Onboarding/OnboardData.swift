//
//  OnboardData.swift
//  NG Notes
//
//  Created by William Kingsley on 12/23/20.
//

import Foundation
import UIKit

enum OnboardData {
    static func buildSet(width: CGFloat = 350, height: CGFloat = 450) -> OnboardSet {
        let onboardSet = OnboardSet()
        onboardSet.dimensions(width: width, height: height)
        // Add some new cards here if you want...
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
