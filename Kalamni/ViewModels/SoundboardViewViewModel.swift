//
//  SoundboardViewViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import AVFoundation
import Foundation

class SoundboardViewViewModel: ObservableObject {
    let synthesizer = AVSpeechSynthesizer()
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    func talk() {
        var utterance = AVSpeechUtterance(string: "Hello World")
        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Samantha-compact")
        
        synthesizer.speak(utterance)

        utterance = AVSpeechUtterance(string: "مرحبا بالعالم")
        utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")

        synthesizer.speak(utterance)
    }
}
