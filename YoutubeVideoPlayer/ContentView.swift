//
//  ContentView.swift
//  YoutubeVideoPlayer
//
//  Created by Raphael Cerqueira on 13/07/21.
//

import SwiftUI
import YouTubePlayer

struct ContentView: View {
    var body: some View {
        YoutubeView(videoID: "UFXt5pdpNMQ")
    }
}

struct YoutubeView: UIViewRepresentable {
    typealias UIViewType = YouTubePlayerView
    var videoID: String
    
    func makeUIView(context: Context) -> YouTubePlayerView {
        let player = YouTubePlayerView()
        player.delegate = context.coordinator
        return player
    }
    
    func updateUIView(_ uiView: YouTubePlayerView, context: Context) {
        uiView.loadVideoID(videoID)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    // auto play
    class Coordinator: YouTubePlayerDelegate {
        func playerReady(_ videoPlayer: YouTubePlayerView) {
            videoPlayer.play()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
