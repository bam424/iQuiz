//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/9/17.
//  Copyright © 2017 Brandon Mar. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    
    var pressedButton = false
    var answerButtons : [UIButton] = [UIButton]()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(pressedButton == false) {
            pressedButton = true
            sender.backgroundColor = UIColor.blue
            sender.layer.cornerRadius = 10
            sender.setTitleColor(.white, for: .normal)
            sender.isSelected = true
            nextButton.isHidden = false
        } else {
            pressedButton = false
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(.blue, for: .normal)
            nextButton.isHidden = true
        }
        print(sender.currentTitle!)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        var text = sender.titleLabel?.text
        if text == "Submit >" {
            answerCheck()
            questionIndex = questionIndex + 1
            if(questionIndex != questionSet.count) {
                sender.setTitle("Next >", for: .normal)
            } else {
                nextButton.isHidden = true
                correctLabel.isHidden = true
                resultsButton.isHidden = false
            }
            text = (sender.titleLabel?.text)!
        } else {
            setText()
            for button in answerButtons {
                button.backgroundColor = UIColor.white
                button.setTitleColor(.blue, for: .normal)
                button.isSelected = false
            }
            nextButton.isHidden = true
        }
    }
    
    func answerCheck() {
        correctLabel.isHidden = false
        var correctAnswer = answerSet[questionIndex][correctAnswers[questionIndex]]
        for button in answerButtons {
            if(button.isSelected) {
                if (button.currentTitle! == correctAnswer) {
                    correctLabel.text! = "Correct!"
                    button.backgroundColor = UIColor.green
                    quizResults = quizResults + 1
                    print(quizResults)
                } else {
                    correctLabel.text! = "Wrong!"
                    button.backgroundColor = UIColor.red
                }
            }
        }
    }
    
    var questionSet : [String]!
    var answerSet : [[String]]!
    var correctAnswers : [Int]!
    var questionIndex : Int!
    var quizResults : Int!
    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var categoryTextField: UILabel!
    var subjectTitle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryTextField.text = subjectTitle
        setText()
        nextButton.isHidden = true
        resultsButton.isHidden = true
        correctLabel.isHidden = true
        answerButtons = [self.choice1, self.choice2, self.choice3, self.choice4]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    
    func setText() {
        question.text = questionSet[questionIndex]
        choice1.setTitle(answerSet[questionIndex][0], for: .normal)
        choice2.setTitle(answerSet[questionIndex][1], for: .normal)
        choice3.setTitle(answerSet[questionIndex][2], for: .normal)
        choice4.setTitle(answerSet[questionIndex][3], for: .normal)
        nextButton.setTitle("Submit >", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Results" {
            let results = segue.destination as! ResultsViewController
            results.questions = questionSet.count
            results.correct = quizResults
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
