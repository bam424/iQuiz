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
    var pressedButton = false
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.blue
        sender.layer.cornerRadius = 10
        pressedButton = true
        print(sender.currentTitle!)
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
