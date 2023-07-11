//
//  Player.swift
//  NoiseLoop
//
//  Created by Erkhaan  on 19.06.2023.
//

import UIKit
import AVFAudio
import MediaPlayer

final class Player: NSObject, AVAudioPlayerDelegate {
    
    // MARK: - Properties
    
    weak var delegate: RemoteControlDelegate?
    var player: AVAudioPlayer!
    private var filePath = AudioFilePath.rain
    
    // MARK: - Methods
    
    func playAudio() {
        guard let fileUrl = Bundle.main.url(
            forResource: filePath.rawValue,
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
    
    func configure(delegate: RemoteControlDelegate) {
        self.delegate = delegate
        setupRemoteControl()
    }
    
    private func setupRemoteControl() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget(
            self,
            action: #selector(doPlay))
        commandCenter.pauseCommand.addTarget(
            self,
            action: #selector(doPause))
        commandCenter.togglePlayPauseCommand.addTarget(
            self,
            action: #selector(doPlayPause))
    }
    
    @objc func doPlayPause(
        _ event: MPRemoteCommandEvent
    ) -> MPRemoteCommandHandlerStatus {
        guard let player = player else { return .commandFailed }
        if player.isPlaying {
            pause()
            delegate?.remotePause()
        } else {
            playAudio()
            delegate?.remotePlay()
        }
        return .success
    }
    
    @objc func doPlay(
        _ event: MPRemoteCommandEvent
    ) -> MPRemoteCommandHandlerStatus {
        playAudio()
        delegate?.remotePlay()
        return .success
    }
    
    @objc func doPause(
        _ event: MPRemoteCommandEvent
    ) -> MPRemoteCommandHandlerStatus {
        pause()
        delegate?.remotePause()
        return .success
    }
}
