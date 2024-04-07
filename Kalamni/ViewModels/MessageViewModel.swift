//
//  MessageViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 3/31/24.
//

import FirebaseFirestore
import Foundation

class MessageViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userID: String
    static var name: String? = nil
    static var email: String? = nil
    static var replyEmail = ""

    init(userID: String) {
        self.userID = userID
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("messages")
            .document(id)
            .delete()
    }
}
