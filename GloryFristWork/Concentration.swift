//
//  Concentration.swift
//  GloryFristWork
//
//  Created by mac on 2023/10/16.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    func chooseCard(at index:Int) {
        assert(cards.indices.contains(index), "Concentreation.chooseCard(at: \(index)): chosen index not in the cards" )
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards amtch
                if cards[matchIndex].identifier ==  cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards : Int) {
        assert(numberOfPairsOfCards > 0, "Concentreation.init(at: \(numberOfPairsOfCards): you need one pair of cards" )
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
             cards += [card, card]
             
        }
        // TODO : Shuffle the cards 숙제
    }
}
 
