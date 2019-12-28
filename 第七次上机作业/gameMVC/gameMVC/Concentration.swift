//
//  Concentration.swift
//  gameMVC
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 2016110340. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var index0f0neAnd0nlyFaceUpCard: Int?
    func chooseCard(at index: Int) {
        if !cards [index].isMatched {
            if let matchIndex = index0f0neAnd0nlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards [index].isFaceUp = true
                index0f0neAnd0nlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards .indices {
                    cards[flipDownIndex].isFaceUp = false
                    cards[index].isFaceUp = true
                    index0f0neAnd0nlyFaceUpCard = index
                }
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    // T0D0: Shuffle the cards
    }
}
