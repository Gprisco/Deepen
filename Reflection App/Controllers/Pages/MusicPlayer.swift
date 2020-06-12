//
//  MusicPlayer.swift
//  Reflection App
//
//  Created by Lorenzo on 14/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import AVFoundation

class MusicPlayer: UIViewController {
    
    //    Music Button
    private var AudioPlayer = AVAudioPlayer()
    
    static let sharedPlayer = MusicPlayer()
    
    func playMusic() {
        let path = Bundle.main.path(forResource: "relax.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            AudioPlayer = try AVAudioPlayer(contentsOf: url)
            AudioPlayer.numberOfLoops = -1
            AudioPlayer.play()
        } catch {
            print("Could not load the file!")
        }
    }
    
    func stopMusic() {
        AudioPlayer.pause()
    }
 
    
    
    
}
