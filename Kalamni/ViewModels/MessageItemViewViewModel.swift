//
//  MessageItemViewViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 3/31/24.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation
import AVFoundation


class MessageItemViewViewModel: ObservableObject {
    let synthesizer = AVSpeechSynthesizer()
    @Published var name: String? = nil
    @Published var email: String? = nil

    init() {}
    
    func fetchSender(userID: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.name = data["name"] as? String ?? ""
                self?.email = data["email"] as? String ?? ""
            }
        }
    }
    
    func toggleIsRead(item: MessageItem) {
        let utterance = AVSpeechUtterance(string: item.message)
        utterance.voice = AVSpeechSynthesisVoice(language: item.language)
        synthesizer.speak(utterance)
        
        if item.isRead {
            return
        }
        
        var itemCopy = item
        itemCopy.setRead(true)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("messages")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
