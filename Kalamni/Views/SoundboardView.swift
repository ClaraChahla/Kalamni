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

    let layout = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                HeaderView(title: "Soundboard", subtitle: "", angle: 10, background: .mint).padding(.bottom, 420)
                
                var itemset = items.chunked(into: 9)
                
                VStack {
                    TabView {
                        if items.count != 0 {
                            ForEach(itemset, id: \.self) { itemGroup in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15).frame(width: 360, height: 420).foregroundColor(.mint).offset(y:100)
                                    Grid {
                                        ForEach(itemGroup, id: \.self) { item in
                                            ZStack{
                                                SoundboardItemView(item: item).frame(width: 100, height: 100).offset(x:50)
                                            }
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
