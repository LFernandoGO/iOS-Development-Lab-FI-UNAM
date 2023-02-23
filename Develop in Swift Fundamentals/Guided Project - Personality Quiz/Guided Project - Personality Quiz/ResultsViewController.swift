//
//  ResultsViewController.swift
//  Guided Project - Personality Quiz
//
//  Created by alumno on 02/02/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    

    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult(){
        let frequencyOfAnswers = responses.reduce(into: [AnimalType: Int]()) { (counts, answer) in
            if let existingCount = counts[answer.type] {
                counts[answer.type] = existingCount + 1
            } else{
                counts[answer.type] = 1
            }
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
        {(pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
