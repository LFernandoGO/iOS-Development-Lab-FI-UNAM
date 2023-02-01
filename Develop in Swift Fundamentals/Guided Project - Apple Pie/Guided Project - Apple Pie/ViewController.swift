//
//  ViewController.swift
//  Guided Project - Apple Pie
//
//  Created by Alumno on 31/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer","swift","glorious","incandescent","bug","program"]
    let incorrectMovesAllowed = 7
    
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
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
            let alertL = UIAlertController(title: "Perdiste", message: "No adivinaste la palabra", preferredStyle: .alert)
            alertL.addAction(UIAlertAction(title: "Jugar de nuevo", style: .default))
            self.present(alertL, animated: true, completion: nil)
        } else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
            let alert = UIAlertController(title: "Ganaste", message: "Adivinaste la palabra", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continuar", style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {
            updateUI()
        }
    }
    
    var currentGame: Game!
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
        
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons{
            button.isEnabled = true
        }
    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
}

