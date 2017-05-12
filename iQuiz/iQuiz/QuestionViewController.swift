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
    
    var pressedButton = false
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(pressedButton == false) {
            pressedButton = true
            sender.backgroundColor = UIColor.blue
            sender.layer.cornerRadius = 10
            sender.setTitleColor(.white, for: .normal)
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
            questionIndex = questionIndex + 1
            sender.setTitle("Next >", for: .normal)
            text = (sender.titleLabel?.text)!
        } else {
            if(questionIndex < questionSet.count) {
                print("test")
                setText()
                nextButton.isHidden = true
            } else {
                
            }
        }
    }
    
    
    
    var questionSet : [String]!
    var answerSet : [[String]]!
    var correctAnswers : [Int]!
    var questionIndex : Int!
    
    @IBOutlet weak var categoryTextField: UILabel!
    var subjectTitle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryTextField.text = subjectTitle
        setText()
        nextButton.isHidden = true

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
