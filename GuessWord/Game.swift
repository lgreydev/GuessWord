//
//  Game.swift
//  GuessWord
//
//  Created by Sergey Lukaschuk on 18.05.2021.
//

import Foundation


class Game {
    
    var city = City()
    
    var life = 6
    var level = 0
    lazy var hiddenWord = city.name.randomElement()!
    var guessedLetter = [Character]()
    var onButton = false
    
    /// The word that is displayed on the screen
    var guessedWord: String {
        var wordLabel = ""
        for letter in hiddenWord {
            guessedLetter.contains(letter) ? wordLabel.append("\(letter) ") : wordLabel.append("❓")
        }
        return wordLabel.uppercased()
    }
    

    
    func newRound() {
        print(#function)
        if life > 0 {
            hiddenWord = city.name.randomElement()!
            guessedLetter = [Character]()
            life = 6
            level += 1
            onButton = true
        } else {
            hiddenWord = city.name.randomElement()!
            guessedLetter = [Character]()
            life = 6
            level = 0
            onButton = true
        }
    }
    
    
    /// Checks letters for a match in 'hiddenWord'
    /// - Parameter letter: which we pass when we click on the button
    fileprivate func matchLetter(_ letter: Character) {
        if hiddenWord.contains(letter) {
            guessedLetter.append(letter)
        } else {
            life -= 1
        }
    }
    
    /// Start game
    /// - Parameter letter: which we pass when we click on the button
    func playGame(_ letter: Character) {
        matchLetter(letter)
    }
}

