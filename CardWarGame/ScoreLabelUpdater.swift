//
//  ScoreLabelUpdater.swift
//  CardWarGame
//
//  Created by Harut on 23/04/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

func updateScoreLabels(cards: cardGenerator, suits: UISegmentedControl, playerScoreLabel: UILabel, cpuScoreLabel: UILabel, playerCardImage: UIImageView, cpuCardImage: UIImageView) {
    let playerCardTitle = cards.getPlayerCardTitle
    let cpuCardTitle = cards.getCpuCardTitle
    var playerWin = false
    var cpuWin = false
    playerCardImage.layer.borderColor = UIColor(red: 75/250, green: 107/250, blue: 47/250, alpha: 1.0).cgColor
    cpuCardImage.layer.borderColor = UIColor(red: 75/250, green: 107/250, blue: 47/250, alpha: 1.0).cgColor
    
    guard var trump = suits.titleForSegment(at: suits.selectedSegmentIndex) else { fatalError("coudn't get the trump") }
    switch trump {
    case "♦️":
        trump = "Diamonds"
    case "♣️":
        trump = "Clubs"
    case "♥️":
        trump = "Hearts"
    default:
        trump = "Spades"
    }
    
    
    if (playerCardTitle == cpuCardTitle) || (playerCardTitle != trump && cpuCardTitle != trump ) {
        if cards.getPlayerCardNum > cards.getCpuCardNum { playerWin = true }
        else if cards.getPlayerCardNum < cards.getCpuCardNum { cpuWin = true }
    }
    else if playerCardTitle == trump { playerWin = true }
    else { cpuWin = true }
    
    if playerWin {
        let playerScore = Int(playerScoreLabel.text!)
        playerScoreLabel.text = "\(playerScore! + 1)"
        playerCardImage.layer.borderColor = UIColor.red.cgColor
        cpuCardImage.clipsToBounds = true
        playerWin = false
    } else if cpuWin {
        let cpuScore = Int(cpuScoreLabel.text!)
        cpuScoreLabel.text = "\(cpuScore! + 1)"
        cpuCardImage.layer.borderColor = UIColor.red.cgColor
        cpuCardImage.clipsToBounds = true
        cpuWin = false
    }
    
}
