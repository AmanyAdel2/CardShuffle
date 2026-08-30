//
//  ShuffleCard.swift
//  CardShuffle
//
//  Created by Macos on 5/08/2026.
//

import Foundation
import SwiftUI
struct ShuffleCard: Identifiable {
    let id = UUID()
    let color: Color
    var flipRotation: Double = 0
}
