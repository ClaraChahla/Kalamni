//
//  Message.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import Foundation

struct MessageItem: Codable, Identifiable {
    let id: String
    let idSender: String
    let name: String
    let email: String
    let language: String
    let message: String
    let createdDate: TimeInterval
    var isRead: Bool
    
    mutating func setRead(_ state: Bool) {
        isRead = state
    }
}
