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
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var game = Game()
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
    }

    
    // MARK: - Update UI
    func updateUI() {
        print(game.hiddenWord)
        imageView.image = UIImage(named: game.hiddenWord)
        levelLabel.text = "🏆 \(game.level)"
        wordLabel.text = game.guessedWord
        lifeLabel.text = String.init(repeating: "❤️", count: game.life)
        stateGame()
    }
    
    
    // MARK: - Action
    @IBAction func pressedButtons(_ sender: UIButton) {
        sender.isEnabled = false
        if sender.isEnabled == false {
            sender.backgroundColor = .white
        }
        
        let letter = sender.titleLabel?.text ?? "no letter"
        game.playGame(Character(letter.lowercased()))
        updateUI()
    }
    
    
    func buttonOn() {
        print(#line)
            for button in letterButtons {
                if game.onButton {
                    print(#line)
                    button.isEnabled = true
                    button.backgroundColor = .systemTeal
                }
            }
        print(#line)
            game.onButton = false
        }
    
    
    func stateGame() {
        let currentWord = (wordLabel.text?.lowercased())!
        let word = currentWord.replacingOccurrences(of: " ", with: "")
        
        if game.hiddenWord == word {
            messageAlert()
        } else if game.life == 0 {
            messageAlert()
        }
    
    }
    
    

    func messageAlert() {
        let alert = UIAlertController(
            title: game.life > 0 ? "Win" : "No Win",
                    message: "message",
                    preferredStyle: .alert)
                
                let action = UIAlertAction(
                    title: "Ok",
                    style: .default) { action -> Void in
                    self.game.newRound()
                    self.updateUI()
                    self.buttonOn()
                }
        
        alert.addAction(action)
                present(alert, animated: true, completion: nil)
        
    }
    
//    @IBAction func Alert()
//    {
//       let alertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.Alert)
//
//       alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default)
//       { action -> Void in
//         // Put your code here
//       })
//       self.presentViewController(alertController, animated: true, completion: nil)
//
//    }
    
    
}

