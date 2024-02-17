//
//  MainViewViewModel.swift
//  Kalamni
//
//  Created by csuftitan on 2/17/24.
//

import AVFoundation
import Foundation


class MainViewViewModel: ObservableObject {
    let synthesizer = AVSpeechSynthesizer()

    init() {
        talk()
    }
    
    func talk() {
        let utterance = AVSpeechUtterance(string: "The quick brown fox jumped over the lazy dog.")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        synthesizer.speak(utterance)
        print("test from talk()")
    }
}
