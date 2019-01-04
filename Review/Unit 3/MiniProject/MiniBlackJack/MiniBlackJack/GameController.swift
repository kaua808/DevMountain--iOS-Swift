//
//  GameController.swift
//  MiniBlackJack
//
//  Created by Kaleo Kim on 4/19/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class GameController {
    
    enum Winner {
        case Player
        case Computer
        case Tie
    }
    
    static func playGame(completion: (winner: Winner, playerCard: Card, computerCard: Card) -> Void ) {
        
        CardController.drawCards(2) { (cards) in
            guard cards.count == 2 else { return }
            let playerCard = cards[0]
            let compCard = cards[1]
            if playerCard.intValue > compCard.intValue {
                completion(winner: Winner.Player, playerCard: playerCard, computerCard: compCard)
            } else if playerCard.intValue < compCard.intValue {
                completion(winner: Winner.Computer, playerCard: playerCard, computerCard: compCard)
            } else {
                completion(winner: Winner.Tie, playerCard: playerCard, computerCard: compCard)
            }
            
        }
        
    }
    
}