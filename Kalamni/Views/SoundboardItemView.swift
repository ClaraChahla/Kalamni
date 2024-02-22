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
                .font(.body)
                .frame(width:120, height: 260)
            Button {
                viewModel.toggleIsFavorite(item: item)
            } label: {
                Image(systemName: item.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .font(.system(size: 25))
            }
        }
    }
}

#Preview {
    SoundboardItemView(item: .init(
        id:"123",
        image: "image dir",
        textEnglish: "Test English",
        textArabic: "Test Arabic",
        isFavorite: false
    ))
}
