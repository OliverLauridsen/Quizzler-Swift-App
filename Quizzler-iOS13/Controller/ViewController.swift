//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var userScore: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.updateUI()
            }
            
        } else {
            sender.backgroundColor = UIColor.red
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.updateUI()
            }
        }
        
        quizBrain.nextQuestion()
    }
    
    func updateUI() {
        questionlabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        userScore.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

