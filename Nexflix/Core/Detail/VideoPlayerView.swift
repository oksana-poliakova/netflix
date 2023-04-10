//
//  VideoPlayerView.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 10.04.2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State var player = AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
    
    var body: some View {
        VStack {
            VideoPlayer(player: player, videoOverlay: {
                VStack(alignment: .leading) {
                    Text("Video name")
                        .foregroundColor(.gray)
                        .bold()
                        .font(.title)
                        .padding()
                    Spacer()
                }
            })
            .frame(
                width: 400,
                height: 300)
            Spacer()
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
