//
//  Language.swift
//  Kalamni
//
//  Created by csuftitan on 3/7/24.
//

import Foundation

enum Language: String, CaseIterable, Identifiable {
    case english, arabic
    var id: Self { self }
}
