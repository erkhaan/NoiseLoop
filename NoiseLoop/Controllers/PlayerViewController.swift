//
//  PlayerViewController.swift
//  NoiseLoop
//
//  Created by Erkhaan  on 29.05.2023.
//

import UIKit
import SnapKit
import AVFAudio

final class PlayerViewController: UIViewController {
    
    // MARK: - Views
    
    private let playButton = PlayButton()
    
    // MARK: - Properties
    
    private let player = Player()
    private var currentFile = AudioFilePath.rain
    
    // MARK: - VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    // MARK: - Initial setup
    
    private func setupViews() {
        view.backgroundColor = .systemIndigo
        view.addSubview(playButton)
        playButton.addTarget(
            self,
            action: #selector(buttonTapped),
            for: .touchUpInside)
    }
    
    private func setupLayout() {
        playButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100.0)
            make.height.equalTo(50.0)
        }
    }
    
    // MARK: - Audio
    
    private func playAudio() {
        player.playAudio(file: currentFile.rawValue)
    }
    
    private func pauseAudio() {
        player.pause()
    }
    
    // MARK: - Button action
    
    @objc private func buttonTapped() {
        if playButton.isPlaying {
            pauseAudio()
        } else {
            playAudio()
        }
        playButton.changeState()
    }
}

