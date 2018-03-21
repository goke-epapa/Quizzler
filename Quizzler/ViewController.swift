//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            // True
            pickedAnswer = true
        } else if sender.tag == 2 {
            // False
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        let realQuestionNumber = questionNumber + 1;
        progressBar.frame.size.width = (view.frame.size.width / 13.0) * CGFloat(realQuestionNumber)
        progressLabel.text = String(questionNumber + 1) + " of " + String(allQuestions.list.count)
    }
    

    func nextQuestion() {
        if questionNumber < allQuestions.list.count {
            let nextQuestion = allQuestions.list[questionNumber]
            questionLabel.text = nextQuestion.questionText
            pickedAnswer = nextQuestion.answer
            
            updateUI()
        } else {
            let alert = UIAlertController(title: "Game Over", message: "You've finished with the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            score += 1
            ProgressHUD.showSuccess("Correct")
        } else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
        score = 0
    }
    

    
}
