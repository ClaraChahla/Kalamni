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
    @Published var language: String = ""
    
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
            }
        }
    }
    
    
    init(userID: String) {
        self.userID = userID
    }
    
    func talk(textEnglish:String, textArabic:String, language:String) {
        let text = language == "en-US" ? textEnglish : textArabic
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        
        synthesizer.speak(utterance)
    }
}

// english: "en-US"
// arabic: "ar-SA" "مرحبا بالعالم"
