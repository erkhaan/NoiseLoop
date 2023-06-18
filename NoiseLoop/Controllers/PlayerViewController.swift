//
//  PlayerViewController.swift
//  NoiseLoop
//
//  Created by Erkhaan  on 29.05.2023.
//

import UIKit
import SnapKit

final class PlayerViewController: UIViewController {
    
    // MARK: - Views
    
    private let playButton = PlayButton()
    
    // MARK: - VC lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    // MARK: - Initial setup
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(playButton)
        playButton.addTarget(
            self,
            action: #selector(buttonTapped(_:)),
            for: .touchUpInside)
    }
    
    private func setupLayout() {
        playButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(100.0)
            make.height.equalTo(50.0)
        }
    }
    
    // MARK: - Button action
    
    @objc private func buttonTapped(_ button: UIButton) {
        playButton.changeState()
    }
}

