//
//  SoundboardView.swift
//  Kalamni
//
//  Created by csuftitan on 2/21/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct SoundboardView: View {
    @StateObject var viewModel = SoundboardViewViewModel()
    var items: [SoundboardItem]

    let columns: [GridItem] = [        GridItem(.fixed(110)),
                                       GridItem(.fixed(110)),
                                       GridItem(.fixed(110))]
    
    var body: some View {
        NavigationView {
            ZStack {
                HeaderView(title: "Soundboard", subtitle: "", angle: 10, background: .mint).padding(.bottom, 420)
                
                let itemset = items.chunked(into: 9)
                
                VStack {
                    TabView {
                        if items.count != 0 {
                            ForEach(itemset, id: \.self) { itemGroup in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 360, height: 360)
                                        .foregroundColor(.mint)
                                        .offset(y:150)
                                    VStack {
                                        Spacer().frame(minHeight: 300, maxHeight: 300)
                                        LazyVGrid(columns: columns) {
                                                    ForEach(itemGroup, id: \.self) { item in
                                                        Button {
                                                            viewModel.talk(text: item.textEnglish, language: "en-US")
                                                        } label: {
                                                            SoundboardItemView(item: item, language: "en-US")
                                                                              .frame(width: 100, height: 100)
                                                                              .padding(4)
                                                        }
                                                    }
                                                }
                                        if (itemGroup.count < 4) {
                                            Spacer().frame(minHeight: 230, maxHeight: 230)
                                        } else if (itemGroup.count < 7) {
                                            Spacer().frame(minHeight: 115, maxHeight: 115)
                                        }
                                    }
                                }
                            }
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15).frame(width: 360, height: 420).foregroundColor(.mint).offset(y:100)
                                Text("Nothing to show right now")
                                    .bold()
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .offset(y: 100)
                                    .shadow(color: .black, radius: 1)
                            }
                        }
                    }
                            .tabViewStyle(PageTabViewStyle())
                            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
            }
        }
    }
}

#Preview {
    SoundboardView(items: SoundboardItem.sampleData)
}


//VStack {
//    Button {
//        viewModel.talk()
//    } label: {
//        SoundboardItemView(item: SoundboardItem(id: "123", image: "img", textEnglish: "Hello World!", textArabic: "Text", isFavorite: false))
//    }
//}

//private func emoji(_ value: Int) -> String {
//        guard let scalar = UnicodeScalar(value) else { return "?" }
//        return String(Character(scalar))
//    }
//
//let columns = [GridItem(.flexible())]

//                ScrollView(.horizontal) {
//                            LazyHStack {
//                                ForEach(0..<5) { i in
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .fill(Color(hue: Double(i+2) / 10, saturation: 0.5, brightness: 0.9).gradient)
//                                        .frame(width: 360, height: 420)
//                                }
//                            }
//                            .scrollTargetLayout()
//                        }
//                        .scrollTargetBehavior(.viewAligned)
//                        .safeAreaPadding(.horizontal, 400).padding(.bottom, -250)
//
//                ScrollView(.horizontal) {
//                    LazyHGrid(rows: columns) {
//                        ForEach(0x1f600...0x1f679, id: \.self) { value in
//                            Text(String(format: "%x", value))
//                            Text(emoji(value))
//                                .font(.largeTitle)
//                        }
//                    }
//                }
