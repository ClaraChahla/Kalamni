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
    
    init(){}
    
    func talk(text:String, language:String) {
        var utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        
        synthesizer.speak(utterance)
    }
}

// english: "en-US"
// arabic: "ar-SA" "مرحبا بالعالم"
