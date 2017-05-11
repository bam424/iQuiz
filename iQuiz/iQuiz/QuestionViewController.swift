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
    
    var questionSet : [String]!
    var answerSet : [[String]]!
    
    @IBOutlet weak var categoryTextField: UILabel!
    var subjectTitle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryTextField.text = subjectTitle

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
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
