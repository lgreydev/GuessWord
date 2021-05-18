//
//  ViewController.swift
//  GuessWord
//
//  Created by Sergey Lukaschuk on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Property
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
 
    var game = Game()
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
       updateUI()
       
    }

    
    // MARK: - Update UI
    func updateUI() {
        print(game.hiddenWord)
        lifeLabel.text = String.init(repeating: "❤️", count: game.life)
        levelLabel.text = "🏆 \(game.level)"
        wordLabel.text = game.guessedWord
    }
    
    
    // MARK: - Action
    @IBAction func pressedButtons(_ sender: UIButton) {
        let letter = sender.titleLabel?.text ?? "no letter"
        game.playGame(Character(letter.lowercased()))
        updateUI()
    }
    
    
    
    
}

