//
//  AudioPlayer.swift
//  Birl
//
//  Created by Matheus Ruschel on 7/19/16.
//  Copyright © 2016 Matheus Ruschel. All rights reserved.
//
import AVFoundation

class AudioPlayer {
    
    static let sharedInstance = AudioPlayer()
    
    var audioPlayer:AVAudioPlayer?
    
    func playSound(withName name: String) {
        let url = NSBundle.mainBundle().URLForResource(name, withExtension: "mp3")!
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: url)
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch let error as NSError {
            print(error.description)
        }
    }


}
