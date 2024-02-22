//
//  SoundboardItem.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import Foundation

struct SoundboardItem: Codable, Identifiable {
    let id: String
    let image: String
    let category: String
    let textEnglish: String
    let textArabic: String
    var isFavorite: Bool
    
    init(id: String, image: String, category: String, textEnglish: String, textArabic: String, isFavorite: Bool) {
        self.id = id
        self.image = image
        self.category = category
        self.textEnglish = textEnglish
        self.textArabic = textArabic
        self.isFavorite = isFavorite
    }
    
    mutating func setFavorite(_ state: Bool) {
        isFavorite = state
    }
}
