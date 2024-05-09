//
//  Category.swift
//  Kalamni
//
//  Created by csuftitan on 5/8/24.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case all, greetings, connecters, numbers, people, shopping, health
    var id: Self { self }
}
