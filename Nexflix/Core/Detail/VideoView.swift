//
//  VideoView.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 05.04.2023.
//

import SwiftUI
import AVKit

//"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"

struct VideoView: View {
    
    // MARK: - Properties
    
    @State var player: AVPlayer
    
    // MARK: - Init
    
    init(player: AVPlayer) {
        self.player = player
    }
    
    // MARK: - Body
    
    var body: some View {
        VideoView(player: player)
            .frame(width: 400,
                   height: 300,
                   alignment: .center)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        let videoURL = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4") ?? URL(fileURLWithPath: "")
        
        let player = AVPlayer(url: videoURL)
        VideoView(player: player)
    }
}
