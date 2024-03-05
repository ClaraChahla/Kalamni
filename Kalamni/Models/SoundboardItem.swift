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


extension SoundboardItem {
    static let sampleData: [SoundboardItem] =
    [
        SoundboardItem(id: "0",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Hello",
                       textArabic: "Hello",
                       isFavorite: false),
        
        SoundboardItem(id: "2",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "World",
                       textArabic: "World",
                       isFavorite: false),
        
        SoundboardItem(id: "3",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Hi",
                       textArabic: "Hi",
                       isFavorite: false),
        
        SoundboardItem(id: "4",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Planet",
                       textArabic: "Planet",
                       isFavorite: false),
        SoundboardItem(id: "5",
                       image: "img/dir",
                       category: "Test2",
                       textEnglish: "This",
                       textArabic: "This",
                       isFavorite: false),
        
        SoundboardItem(id: "6",
                       image: "img/dir",
                       category: "Test2",
                       textEnglish: "is",
                       textArabic: "is",
                       isFavorite: false),
        
        SoundboardItem(id: "7",
                       image: "img/dir",
                       category: "Test2",
                       textEnglish: "a",
                       textArabic: "a",
                       isFavorite: false),
        
        SoundboardItem(id: "8",
                       image: "img/dir",
                       category: "Test3",
                       textEnglish: "test",
                       textArabic: "test",
                       isFavorite: false),
        
        SoundboardItem(id: "9",
                       image: "img/dir",
                       category: "Test3",
                       textEnglish: "bye",
                       textArabic: "bye",
                       isFavorite: false),
        
        SoundboardItem(id: "10",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "!",
                       textArabic: "!",
                       isFavorite: false),
    ]
}

extension SoundboardItem {
    static let sampleDataEmpty: [SoundboardItem] = []
}
