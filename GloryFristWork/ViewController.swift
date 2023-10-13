//
//  ViewController.swift
//  GloryFristWork
//
//  Created by mac on 2023/10/13.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojilChoices = ["😃","🎃","💀","♠︎"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of:  sender) {
            flipCard(withEmoji: emojilChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in card")
        }
//        flipCard(withEmoji: "", on: sender)
    }
    
    
    func flipCard(withEmoji emoji : String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for :UIControl.State.normal)
            button.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        }
        
    }
}
