//
//  Extensions.swift
//  Kalamni
//
//  Created by csuftitan on 2/17/24.
//

import SwiftUI
import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

extension SoundboardItem {
    static let sampleData: [SoundboardItem] =
    [
        SoundboardItem(id: "0",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Hello",
                       textArabic: "مرحبًا",
                       isFavorite: false),
        
        SoundboardItem(id: "2",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "World",
                       textArabic: "عالم",
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
        
        SoundboardItem(id: "11",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "another test",
                       textArabic: "another test",
                       isFavorite: false),
        
        SoundboardItem(id: "12",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "popcorn",
                       textArabic: "popcorn",
                       isFavorite: false),
        
        SoundboardItem(id: "13",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "another test",
                       textArabic: "another test",
                       isFavorite: false),
    ]
}

extension SoundboardItem {
    static let sampleDataEmpty: [SoundboardItem] = []
}
