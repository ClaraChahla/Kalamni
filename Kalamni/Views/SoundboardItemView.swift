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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.teal)
                .frame(width:120, height: 120)
            Text(item.textEnglish)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .frame(width:120, height: 210)
                .shadow(color: .black, radius: 1)
                .bold()
            Button {
                viewModel.toggleIsFavorite(item: &item)
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
        textEnglish: "Test Text",
        textArabic: "Test Arabic",
        isFavorite: false
    ))
}
