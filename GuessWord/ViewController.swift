//
//  ViewController.swift
//  GuessWord
//
//  Created by Sergey Lukaschuk on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    /// Model
    private var game = Game()
    
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    // MARK: - Update UI
    /// Updates the screen state from the model
    private func updateUI() {
        imageView.image = UIImage(named: game.hiddenWord)
        levelLabel.text = "🏆 \(game.level)"
        wordLabel.text = game.guessedWord
        lifeLabel.text = String.init(repeating: "❤️", count: game.life)
        stateGame()
    }
    
    
    // MARK: - Button Background
    /// Change the background of the button depending on the state (isEnabled)
    private func buttonOn() {
        for button in letterButtons {
            if game.onButton {
                button.isEnabled = true
                button.backgroundColor = .systemTeal
            }
        }
        game.onButton = false
    }
    
    
    // MARK: - State Game
    /// Checks the state of the game, if the user guessed the word or spent all their attempts calls a Message Alert.
    private func stateGame() {
        let currentWord = (wordLabel.text?.lowercased())!
        let word = currentWord.replacingOccurrences(of: " ", with: "")
       
        if game.hiddenWord == word && game.level >= 4 {
            messageGameWin()
        } else if game.hiddenWord == word {
            messageNextLevel()
        } else if game.life == 0 {
            messageGameOver()
        }
    }
    
    
    // MARK: - Message Alert
    /// extracted from message Alert
    private func extractedFunc() {
        self.game.newRound()
        self.updateUI()
        self.buttonOn()
    }
    
    /// NEXT ROUND: a window that displays a message upon the completion of a round or a guessed word.
    private func messageNextLevel() {
        let alert = UIAlertController(
            title: "VERY GOOD!",
            message: "😎 😎 😎 😎 😎",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Next Level",
            style: .default) { action -> Void in
            self.extractedFunc()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /// GAME OVER: a window that displays a message upon the completion of a round or a guessed word.
    private func messageGameOver() {
        let alert = UIAlertController(
            title: "YOU LOSE",
            message: "😢 😢 😢 😢 😢",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Start New Game",
            style: .default) { action -> Void in
            self.extractedFunc()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /// WIN GAME: - a window that displays a message upon the completion of a round or a guessed word.
    private func messageGameWin() {
        let alert = UIAlertController(
            title: "YOU WIN!",
            message: "🎉 🎉 🎉 🎉 🎉",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Start New Game",
            style: .default) { action -> Void in
            self.extractedFunc()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
}

