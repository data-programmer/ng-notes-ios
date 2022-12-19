//
//  OnboardCardView.swift
//  NG Notes
//
//  Created by William Kingsley on 12/23/20.
//

import SwiftUI

struct OnboardCardView: View {
    @Binding var isShowing: Bool
    let card: OnboardCard
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(card.title)
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    withAnimation {
                        isShowing = false
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("background"))
                        
                }
            }
            Image(systemName: card.image)
                .resizable()
                .frame(
                    minWidth: 100,
                    idealWidth: 200,
                    maxWidth: 225,
                    minHeight: 100,
                    idealHeight: 200,
                    maxHeight: 225,
                    alignment: .center
                )
            Text(card.text)
                .font(.body)
                .padding(.vertical, 20)
                .padding(.horizontal, 5)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 10)
            .frame(width: width, height: height)
            .background(
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
                .fill(Color(.secondarySystemBackground))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/))
    }
}

struct OnboardCardView_Previews: PreviewProvider {
    static let onboardSet = OnboardSet.previewSet()
    static var previews: some View {
        Group {
            OnboardCardView(isShowing: .constant(true), card: onboardSet.cards[0], width: 350, height: 500)
                .previewLayout(.device)
            OnboardCardView(isShowing: .constant(true), card: onboardSet.cards[0], width: 350, height: 500)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
