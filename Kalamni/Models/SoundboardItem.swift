//
//  SoundboardItem.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import Foundation

struct SoundboardItem: Codable, Identifiable, Hashable {
    let id: String
    let image: String
    let category: String
    let textEnglish: String
    let textArabic: String
    var isFavorite: Bool
    
    mutating func setFavorite(_ state: Bool) {
        isFavorite = state
    }
}
