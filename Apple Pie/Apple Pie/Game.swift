//
//  Game.swift
//  Apple Pie
//
//  Created by David Houghton on 14/7/21.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var gameScore: Int
    
    mutating func playerGuessed(letter: Character) -> Int {
        /*guessedLetters.append(letter)
        print("\(letter)")
        print("\(incorrectMovesRemaining)")
        if !word.contains(letter) {
            //print(incorrectMovesRemaining)
            incorrectMovesRemaining -= 1
            print(incorrectMovesRemaining)
            return 0
        } else {
            gameScore += word.filter{Character in Character == letter}.count
            return word.filter{Character in Character == letter}.count
        }*/
        
        
        guard !guessedLetters.contains(letter) else { return 0 }
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
            return 0
        } else {
            gameScore += word.filter{Character in Character == letter}.count
            return word.filter{Character in Character == letter}.count
        }
        
    }
    
    var formattedWord: String {
        var guessedWord = ""
        
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}


struct Player {
    var name: String
    var score: Int = 0
}
