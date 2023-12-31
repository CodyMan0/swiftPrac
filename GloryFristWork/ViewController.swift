//
//  ViewController.swift
//  GloryFristWork
//
//  Created by mac on 2023/10/13.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
           return (cardButtons.count+1) / 2
   }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
      
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of:  sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in card")
        }
//        flipCard(withEmoji: "", on: sender)
    }
    private func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for : card), for: UIControl.State.normal)
                button.backgroundColor = UIColor(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            } else {
                button.setTitle("", for :UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor(red: 1, green: 0.5763723254, blue: 0, alpha: 1) : UIColor(red: 1, green: 0.5763723254, blue: 1, alpha: 1)
            }
        }
        
    }
    private var emojiChoices = ["😃","🎃","💀","💀","🎛️","🕯️","💡"]
    
//    var emoji = Dictionary<Int,String>()
    private var emoji = [Int : String]()
    
    private func emoji (for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            
        }
        return  emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random : Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
