//
//  ViewController.swift
//  Apple Pie
//
//  Created by David Houghton on 14/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:Variables
    var listOfWords = ["buccaneer","swift","glorious","incandescent","bug","program"]
    
    let incorrectMovesAllowed = 7
    
   var allPlayers:[Player] = [
        Player(name: "Kira"),
        Player(name: "Zoe")
    ]
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalScore = 0
    
    var currentGame: Game!
    
    var currentPlayer: Player! {
        get {allPlayers[currentPlayerIndex]}
        set {allPlayers[currentPlayerIndex] = newValue}
    }
    
    var currentPlayerIndex: Int = 0
    
    //MARK:Outlets / Actions
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        print("letterButtonPressed")
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        
        let pointsEarned = currentGame.word.filter{Character in Character == letter}.count
        currentPlayer.score += pointsEarned
        
        //totalScore = currentGame.gameScore
        let playerMadeIncorrectGuess = pointsEarned == 0
        if playerMadeIncorrectGuess {
            nextPlayerTurn()
        }
        updateGameState()
    }
    
    
    
    
    
    
    
    
    //MARK:View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    //MARK:Functions
    
    
    
    func newRound(){
        print("newRound")
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [], gameScore: totalScore)
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    
    
    func updateUI(){
        print("updateUI")
        //Original Project code
        /*var letters = [String]()
         for letter in currentGame.formattedWord {
         letters.append(String(letter))
         }*/
        
        
        //Stretch Goal - Map Method - https://developer.apple.com/forums/thread/678379
        let letters = currentGame.formattedWord.map { String($0) }
        
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        totalScoreLabel.text = "\(currentPlayer.name): \(currentPlayer.score)"
    }
    
    
    
    
    
    
    func updateGameState() {
        print("updateGameState")
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            currentPlayer.score += 5
            currentGame.gameScore += 5
            totalScore = currentGame.gameScore
            totalScoreLabel.text = "Player: \(currentPlayer.score) \(totalScore)"
            updateUI()
        } else {
            updateUI()
        }
    }
    
    
    
    
    func enableLetterButtons(_ enable:Bool) {
        print("enableLetterButtons")
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    
    func nextPlayerTurn() {
        print("nextPlayerTurn")
        let nextPlayerIndex: Int = self.currentPlayerIndex + 1
        if allPlayers.indices.contains(nextPlayerIndex) {
            currentPlayerIndex = nextPlayerIndex
        } else {
            currentPlayerIndex = 0
            
        }
    }
}



