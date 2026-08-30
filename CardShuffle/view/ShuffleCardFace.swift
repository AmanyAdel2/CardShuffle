//
//  ShuffleCardFace.swift
//  CardShuffle
//
//  Created by Macos on 5/08/2026.
//

import SwiftUI

struct ShuffleCardFace: View {
    let color: Color

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 24)
                .fill(color)
                .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 5)

            
            HStack(spacing: 12) {
                Circle()
                    .fill(Color.black.opacity(0.15))
                    .frame(width: 36, height: 36)

                VStack(alignment: .leading, spacing: 8) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.black.opacity(0.15))
                        .frame(width: 100, height: 10)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.black.opacity(0.15))
                        .frame(width: 60, height: 10)
                }
            }
            .padding(24)
        }
        .frame(width: 320, height: 220)
    }
}


