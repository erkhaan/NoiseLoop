//
//  AudioSessionService.swift
//  NoiseLoop
//
//  Created by Erkhaan  on 11.07.2023.
//

import Foundation
import AVFAudio

final class AudioSessionService {
    static func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.playback, mode: .default)
        try? audioSession.setActive(true)
    }
}
