//
//  Player.swift
//  NoiseLoop
//
//  Created by Erkhaan  on 19.06.2023.
//

import UIKit
import AVFAudio

final class Player: NSObject, AVAudioPlayerDelegate {
    
    // MARK: - Properties
    
    var player: AVAudioPlayer!
    
    // MARK: - Methods
    
    func playAudio(file: String) {
        guard let fileUrl = Bundle.main.url(
            forResource: file,
            withExtension: "mp3"
        ) else {
            return
        }
        player?.delegate = nil
        player?.stop()
        guard let newPlayer = try? AVAudioPlayer(contentsOf: fileUrl) else {
            return
        }
        player = newPlayer
        player.prepareToPlay()
        player.delegate = self
        player.numberOfLoops = -1
        player.play()
    }
    
    func pause() {
        player.pause()
    }
}
