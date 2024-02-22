//
//  RegisterView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Create an account", angle: -10, background: .orange)

            Form {
                TextField("Full Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()

                TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).autocorrectionDisabled()

                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())

                TLButton(title: "Create Account", background: .green) {
                    viewModel.register()
                }
            }
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}
