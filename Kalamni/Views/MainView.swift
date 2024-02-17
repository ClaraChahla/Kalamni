//
//  ContentView.swift
//  Kalamni
//
//  Created by csuftitan on 2/17/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()

    var body: some View {
        VStack {
            Image(systemName: "cat")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Kalamni")
            
            Button("Talk") {
                viewModel.talk()
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
