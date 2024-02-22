//
//  Message.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import Foundation

struct Message: Codable, Identifiable {
    let id: String
    let idSender: String
    let message: String
    let createdDate: TimeInterval
    var isRead: Bool
    
    mutating func setRead(_ state: Bool) {
        isRead = state
    }
}
