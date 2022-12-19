//
//  NavigationConfiguration.swift
//  NG Notes
//
//  Created by William Kingsley on 12/26/20.
//

import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color("background"))

        navigationBar.standardAppearance = appearance
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
