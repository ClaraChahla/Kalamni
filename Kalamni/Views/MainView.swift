//
//  ContentView.swift
//  Kalamni
//
//  Created by csuftitan on 2/17/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "cat")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Kalamni")
        }
        .padding()
    }
}

#Preview {
    MainView()
}
