//
//  ResultsViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/12/17.
//  Copyright © 2017 Brandon Mar. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsMessage: UILabel!
    @IBOutlet weak var resultsScore: UILabel!
    
    var questions : Int!
    var correct : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        
        resultsScore.text = "\(correct!) / \(questions!)"
        if (correct / questions == 1) {
            resultsMessage.text = "Perfect! You're a genius!"
        } else {
            resultsMessage.text = "Do better next time!!"
        }
        
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
