//
//  MessageViewViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import Foundation

class MessageViewViewModel: ObservableObject {
    private let userID: String

    init(userID: String) {
        self.userID = userID
    }
}
