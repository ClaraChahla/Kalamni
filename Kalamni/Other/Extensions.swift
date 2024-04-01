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
        
        SoundboardItem(id: "1",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "I",
                       textArabic: "أنا",
                       isFavorite: false),
        
        SoundboardItem(id: "2",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Want",
                       textArabic: "بدي",
                       isFavorite: false),
        
        SoundboardItem(id: "3",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Water",
                       textArabic: "ماء",
                       isFavorite: false),
        
        SoundboardItem(id: "4",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Food",
                       textArabic: "أكل",
                       isFavorite: false),
        SoundboardItem(id: "5",
                       image: "img/dir",
                       category: "Test2",
                       textEnglish: "Please",
                       textArabic: "لو سمحت",
                       isFavorite: false),
        
        SoundboardItem(id: "6",
                       image: "img/dir",
                       category: "Test2",
                       textEnglish: "Thank you",
                       textArabic: "شكرن",
                       isFavorite: false),
        
        SoundboardItem(id: "7",
                       image: "img/dir",
                       category: "Test2",
                       textEnglish: "Yes",
                       textArabic: "نعم",
                       isFavorite: false),
        
        SoundboardItem(id: "8",
                       image: "img/dir",
                       category: "Test3",
                       textEnglish: "No",
                       textArabic: "لا",
                       isFavorite: false),
        
        SoundboardItem(id: "9",
                       image: "img/dir",
                       category: "Test3",
                       textEnglish: "More",
                       textArabic: "أكثر",
                       isFavorite: false),
        
        SoundboardItem(id: "10",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "Less",
                       textArabic: "أقل",
                       isFavorite: false),
        
        SoundboardItem(id: "11",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "One",
                       textArabic: "وحد",
                       isFavorite: false),
        
        SoundboardItem(id: "12",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "Two",
                       textArabic: "إثنان",
                       isFavorite: false),
        
        SoundboardItem(id: "13",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "Three",
                       textArabic: "ثلاث",
                       isFavorite: false),
        
        SoundboardItem(id: "14",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "Good morning",
                       textArabic: "صباح الخير",
                       isFavorite: false),
        
        SoundboardItem(id: "15",
                       image: "img/dir",
                       category: "Test4",
                       textEnglish: "Good night",
                       textArabic: "تصبح على خير",
                       isFavorite: false),
        
        SoundboardItem(id: "16",
                       image: "img/dir",
                       category: "Test5",
                       textEnglish: "Good bye",
                       textArabic: "مع السلامة",
                       isFavorite: false),
    ]
}

extension SoundboardItem {
    static let sampleDataOne: [SoundboardItem] = [
        SoundboardItem(id: "0",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Hello",
                       textArabic: "مرحبًا",
                       isFavorite: false),
    ]
}

extension SoundboardItem {
    static let sampleDataEmpty: [SoundboardItem] = []
}

extension SoundboardItem {
    static let sampleMessage: [SoundboardItem] = [
        SoundboardItem(id: "0",
                       image: "img/dir",
                       category: "Test1",
                       textEnglish: "Hello",
                       textArabic: "مرحبًا",
                       isFavorite: false),
        
        SoundboardItem(id: "1",
                       image: "img/dir",
                       category: "Test5",
                       textEnglish: "Good bye",
                       textArabic: "مع السلامة",
                       isFavorite: false),
    ]
}
