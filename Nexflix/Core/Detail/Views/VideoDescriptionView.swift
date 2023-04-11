//
//  VideoDescriptionView.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 11.04.2023.
//

import SwiftUI

struct VideoDescriptionView: View {
    
    // MARK: - Properties
    
    private let title: Title
        
    // MARK: - Init
    
    init(title: Title) {
        self.title = title
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .leading) {
                    Text(title.jawSummary.title)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                    HStack(spacing: 6) {
                        Text("\(title.jawSummary.releaseYear ?? 0)")
                            .foregroundColor(.white)
                        Image("hd_icon")
                        Image("vision_icon")
                        Image("ad_icon")
                    }
                    .padding(.top, 10)
                    Button(action: playButtonPressed, label: {
                        HStack {
                            Image("play")
                                .foregroundColor(.black)
                            Text("Play")
                                .foregroundColor(.black)
                                .font(.headline)
                        }
                    })
                    .callRoundedButton()
                    .background(.white)
                    .cornerRadius(6)
                    Button(action: downloadButtonPressed, label: {
                        HStack {
                            Image("download")
                                .foregroundColor(.gray)
                            Text("Download")
                                .foregroundColor(.gray)
                                .font(.headline)
                        }
                    })
                    .callRoundedButton()
                    .background(Color("dark_grey"))
                    .cornerRadius(6)
                    .padding(.top, 6)
                    VStack(alignment: .leading) {
                        
                        // description
                        Text(title.jawSummary.description ?? "")
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        HStack(spacing: 56) {
                            VStack(spacing: 10) {
                                Image("add_icon")
                                    .foregroundColor(.white)
                                TextUnderIcon(text: "My List")
                            }
                            VStack(spacing: 10) {
                                Image("like_icon")
                                    .foregroundColor(.white)
                                TextUnderIcon(text: "Rate")
                            }
                            VStack(spacing: 10) {
                                Image("share_icon")
                                    .foregroundColor(.white)
                                TextUnderIcon(text: "Share")
                            }
                        }
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    }
                }
            }
            .padding(.all)
        }
    }
    
    func playButtonPressed() {
        
    }
    
    func downloadButtonPressed() {
        
    }
}

struct VideoDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDescriptionView(title: Title(jawSummary: JawSummary(title: "", logoImage: LogoImage(url: "sss"), backgroundImage: BackgroundImage(url: ""), description: "", releaseYear: 0)))
    }
}

// MARK: - Custom modifiers

struct TextUnderIcon: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.gray)
            .font(.callout)
    }
}

struct RoundedButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 55)
            .frame(maxWidth: .infinity)
    }
}

// MARK: - Extensions

extension View {
    func callRoundedButton() -> some View {
        self.modifier(RoundedButton())
    }
}
