//
//  SoundboardViewViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseAuth
import FirebaseFirestore
import AVFoundation
import Foundation

class SoundboardViewViewModel: ObservableObject {
    let synthesizer = AVSpeechSynthesizer()
    private let userID: String
    static var currentLanguage: String? = nil
    @Published var language: String? = nil
    
    init(userID: String) {
        self.userID = userID
    }
    
    func fetchLanguage() {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.language = data["language"] as? String ?? ""
                MessageViewModel.name = data["name"] as? String ?? ""
                MessageViewModel.email = data["email"] as? String ?? ""
                SoundboardViewViewModel.currentLanguage = self?.language
            }
        }
    }
    
    func playQueue(queue: [SoundboardItem]) {
        for item in queue {
            talk(textEnglish: item.textEnglish, textArabic: item.textArabic, language: language!)
        }
    }
    
    static func updateCurrentLanguage(language: String?) {
        self.currentLanguage = language
    }
    
    func talk(textEnglish:String, textArabic:String, language:String) {
        var text = language == "en-US" ? textEnglish : textArabic
        
        if (text.count == 1 && language == "en-US") {
            text = text.lowercased();
        }
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        
        synthesizer.speak(utterance)
    }
}

// english: "en-US"
// arabic: "ar-SA"
