//
//  KalamniApp.swift
//  Kalamni
//
//  Created by csuftitan on 2/17/24.
//

import FirebaseCore
import SwiftUI
import SwiftData

@main
struct KalamniApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: SoundboardItem.self)
    }
}
