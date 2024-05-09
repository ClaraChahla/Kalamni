//
//  RegisterView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    @State private var selectedLanguage: Language = .english


    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Create an account", angle: 0, background: .teal)
                .padding(.top, -40)
            Form {
                TextField("Full Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()

                TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).autocorrectionDisabled()

                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())

                TLButton(title: "Create Account", background: .teal) {
                    viewModel.language = selectedLanguage == .english ? "en-US" : "ar-SA"
                    viewModel.register()
                }
                
            }
            .padding(.top, -160)
        }

        Picker("Language", selection: $selectedLanguage) {
            ForEach(Language.allCases) { language in
                Text(language.rawValue.capitalized)
            }
        }.pickerStyle(.segmented)
            .padding(.bottom, 50)
    }
}

#Preview {
    RegisterView()
}
