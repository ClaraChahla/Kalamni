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
    @Published var email = MessageViewModel.replyEmail
    @Published var message = ""
    @Published var showAlert = false
    var idRecipient = ""
    
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
            name: MessageViewModel.name!,
            email: MessageViewModel.email!,
            language: SoundboardViewViewModel.currentLanguage!,
            message: message,
            createdDate: Date().timeIntervalSince1970,
            isRead: false
        )
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection("users").whereField("email", isEqualTo: email)
          .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
                for document in querySnapshot!.documents {
                    self.idRecipient = document.documentID
                    
                    if self.idRecipient == "" {
                        print("returning")
                        return
                    }
                    
                    db.collection("users")
                        .document(self.idRecipient)
                        .collection("messages")
                        .document(newId)
                        .setData(newMessage.asDictionary())
                }
            }
        }
    }
}
