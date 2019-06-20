//
//  ViewController.swift
//  CardWarGame
//
//  Created by Harut on 22/04/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    let newCardGenerator = cardGenerator()
    
    @IBOutlet weak var suitsSegments: UISegmentedControl!
    
    @IBOutlet weak var leftCardImageView: UIImageView!
    @IBOutlet weak var rightCardImageView: UIImageView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var cpuScoreLabel: UILabel!
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    var audioPlayer: AVAudioPlayer?
    let soundOnIcon = UIImage(named: "soundOn.png")
    let soundOffIcon = UIImage(named: "soundOff.png")
    var soundIsOn: Bool = true
    

    @IBAction func soundPressed(_ sender: UIButton) {
        if soundIsOn {
            audioPlayer?.setVolume(0.0, fadeDuration: 0.1)
            sender.setImage(soundOffIcon, for: .normal)
        } else {
            audioPlayer?.setVolume(1.0, fadeDuration: 0.1)
            sender.setImage(soundOnIcon, for: .normal)
        }
        soundIsOn = !soundIsOn
    }
    
    
    @IBAction func dealButton(_ sender: UIButton) {
        newCardGenerator.generate()
        leftCardImageView.image = UIImage.init(named: newCardGenerator.playerCard)
        rightCardImageView.image = UIImage.init(named: newCardGenerator.cpuCard)
        updateScoreLabels(cards: newCardGenerator, suits: suitsSegments, playerScoreLabel: playerScoreLabel, cpuScoreLabel: cpuScoreLabel, playerCardImage: leftCardImageView, cpuCardImage: rightCardImageView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftCardImageView.cardImage()
        rightCardImageView.cardImage()
        avatarImage.roundedImage()
        
        
        guard let path = Bundle.main.path(forResource: "hipjazz", ofType: "mp3") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        audioPlayer = try?AVAudioPlayer(contentsOf: url)
        if soundIsOn {
            audioPlayer?.play()
            audioPlayer?.numberOfLoops = -1
        }
    }
}
