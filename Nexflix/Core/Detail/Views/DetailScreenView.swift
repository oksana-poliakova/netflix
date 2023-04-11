//
//  DetailScreenView.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 05.04.2023.
//

import SwiftUI
import AVKit

struct DetailScreenView: View {
    
    private let title: Title
    
    init(title: Title) {
        self.title = title
    }
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    VideoPlayerView()
                    VideoDescriptionView(title: title)
                }
            }
        }
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(title: Title(jawSummary: JawSummary(title: "", logoImage: LogoImage(url: "sss"), backgroundImage: BackgroundImage(url: ""), description: "", releaseYear: 2012)))
    }
}


