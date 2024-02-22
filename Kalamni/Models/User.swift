//
//  User.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
