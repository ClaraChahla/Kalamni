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
    
    func talk() {
        var utterance = AVSpeechUtterance(string: "Hello World")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        synthesizer.speak(utterance)

        utterance = AVSpeechUtterance(string: "مرحبا بالعالم")
        utterance.voice = AVSpeechSynthesisVoice(language: "ar-SA")

        synthesizer.speak(utterance)
    }
}
