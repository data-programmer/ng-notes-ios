//
//  OnboardingScreens.swift
//  NG Notes
//
//  Created by William Kingsley on 12/23/20.
//

import SwiftUI

struct OnboardingScreens: View {
    @Binding var isPresenting: Bool
    var onboardSet: OnboardSet
    var body: some View {
        VStack {
            TabView {
                ForEach(onboardSet.cards) { item in
                    OnboardCardView(
                        isShowing: $isPresenting,
                        card: item,
                        width: onboardSet.width,
                        height: onboardSet.height
                    )
                }
            }
            .frame(height: onboardSet.height + 180)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            Spacer()
        }
    }
}

struct OnboardingScreens_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreens(isPresenting: .constant(true), onboardSet: OnboardSet.previewSet())
    }
}
