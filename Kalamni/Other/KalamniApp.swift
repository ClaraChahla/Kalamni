//
//  KalamniApp.swift
//  Kalamni
//
//  Created by csuftitan on 2/17/24.
//

import FirebaseCore
import SwiftUI

@main
struct KalamniApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
