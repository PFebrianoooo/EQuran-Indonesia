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
    private var avAudio: AVAudioPlayer?
    
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
    
    func playLocalSound() {
        
        guard let sound = Bundle.main.url(forResource: "whoosh", withExtension: ".mp3") else { return }
        
        do {
            avAudio = try AVAudioPlayer(contentsOf: sound)
            avAudio?.play()
        } catch {
            print("Error playing local sound")
        }
    }
    
    
    
    
}
