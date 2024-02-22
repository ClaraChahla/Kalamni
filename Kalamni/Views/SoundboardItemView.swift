//
//  SoundboardItemView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import SwiftUI

struct SoundboardItemView: View {
    @StateObject var viewModel = SoundboardItemViewViewModel()
    let item: SoundboardItem
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.cyan)
                .frame(width:120, height: 120)
            Text(item.textEnglish)
                .foregroundColor(.black)
                .font(.caption)
                .frame(width:120, height: 210)
            Button {
                viewModel.toggleIsFavorite(item: item)
            } label: {
                Image(systemName: item.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .font(.system(size: 25))
                    .bold()
            }
        }
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
    ))
}
