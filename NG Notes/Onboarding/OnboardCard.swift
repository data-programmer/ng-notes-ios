//
//  OnboardCard.swift
//  NG Notes
//
//  Created by William Kingsley on 12/23/20.
//

import Foundation

struct OnboardCard: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let text: String
}
