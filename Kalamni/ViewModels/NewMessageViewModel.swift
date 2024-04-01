//
//  NewMessageViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 3/31/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewMessageViewModel: ObservableObject {
    @Published var idRecipient = ""
    @Published var message = ""
    @Published var showAlert = false
    
    init() {}
    
    func send() {
        // Get current userid
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let newId = UUID().uuidString
        let newMessage = MessageItem(
            id: newId,
            idSender: uId,
            message: message,
            createdDate: Date().timeIntervalSince1970,
            isRead: false
        )
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(idRecipient)
            .collection("messages")
            .document(newId)
            .setData(newMessage.asDictionary())
    }
}
