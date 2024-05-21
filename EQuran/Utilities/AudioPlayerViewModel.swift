//
//  AudioPlayerViewModel.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 21/05/24.
//

import Foundation
import SwiftUI
import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    
    @Published var isPlaying: Bool = false
    private var player: AVPlayer?
    
    func play(urls: String) {
        guard let url = URL(string: urls) else { return }
        
        if player == nil {
            player = AVPlayer(url: url)
        }
        player?.play()
        isPlaying = true
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
    }
    
}
