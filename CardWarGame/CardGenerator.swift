//
//  Model.swift
//  CardWarGame
//
//  Created by Harut on 23/04/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import Foundation

class cardGenerator {
    private var playerCardNum = 2
    private var playerCardTitle = "Diamonds"
    private var cpuCardNum = 2
    private var cpuCardTitle = "Diamonds"
    private var suits = ["Diamonds", "Spades", "Hearts", "Clubs"]
    
    func generate() {
        playerCardNum = Int.random(in: 2...14)
        cpuCardNum = Int.random(in: 2...14)
        playerCardTitle = String(suits[Int.random(in: 0...3)])
        cpuCardTitle = String(suits[Int.random(in: 0...3)])
    }
    
    var getPlayerCardNum: Int { return playerCardNum }
    var getCpuCardNum: Int { return cpuCardNum }
    var playerCard: String { return playerCardTitle + String(playerCardNum) }
    
    var getPlayerCardTitle: String { return playerCardTitle }
    var getCpuCardTitle: String { return cpuCardTitle }
    var cpuCard: String { return cpuCardTitle + String(cpuCardNum) }
}

