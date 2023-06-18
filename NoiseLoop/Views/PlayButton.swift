//
//  PlayButton.swift
//  NoiseLoop
//
//  Created by Erkhaan  on 29.05.2023.
//

import UIKit

final class PlayButton: UIButton {
    
    // MARK: - Properties
    
    private enum Titles: String {
        case play = "Play"
        case pause = "Pause"
    }
    private let title = Titles.play
    private var isPlaying = false
    private let customConfiguration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        configuration.title = Titles.play.rawValue
        configuration.buttonSize = .large
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 10.0,
                                                              bottom: 10.0, trailing: 10.0)
        configuration.baseBackgroundColor = .purple
        return configuration
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setupButton() {
        self.configuration = customConfiguration
        titleLabel?.font = .systemFont(ofSize: 20.0)
    }
    
    // MARK: - Change title
    
    func changeState() {
        if isPlaying {
            setTitle(Titles.play.rawValue, for: .normal)
            isPlaying = false
        } else {
            setTitle(Titles.pause.rawValue, for: .normal)
            isPlaying = true
        }
    }
}
