//
//  SoundboardItemView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI

struct SoundboardItemView: View {
    @StateObject var viewModel = SoundboardItemViewViewModel()
    @State var item: SoundboardItem
    @State var language: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.teal)
                Text(language == "en-US" ? item.textEnglish : item.textArabic)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .shadow(color: .black, radius: 1)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                Button {
                    viewModel.toggleIsFavorite(item: &item)
                } label: {
                    Image(systemName: item.isFavorite ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .font(.system(size: 20))
                        .bold()
                        .contentShape(Circle())
                }
            }
        }
        .padding()
    }
}

#Preview {
    SoundboardItemView(item: .init(
        id:"123",
        image: "image dir",
        category: "category",
        textEnglish: "Test English",
        textArabic: "Test Arabic",
        isFavorite: false
    ), language: "en-US"){
        // Action
    }
}
