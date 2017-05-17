//
//  QuizTypeViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/2/17.
//  Copyright © 2017 Brandon Mar. All rights reserved.
//

import UIKit

class QuizTypeViewController: UITableViewController {
    
    var urlString = "http://tednewardsandbox.site44.com/questions.json"
    var refresher: UIRefreshControl!
    var subjects = ["Mathematics", "Marvel", "Science"]
    var descriptions = ["2 + 2 = fish", "Avengers rule", "Chemistry, Biology, Physics"]
    var questions = [String]()
    var answers = [String]()
    var correctAnswers = [Int]()
    
    let questionBank : [String : [String]] = [
        "Mathematics" : [
            "1 + 1 = ?",
            "250 / 5 = ?"
        ],
        "Marvel" : [
            "What is the name of Thor's weapon?",
            "Which of these is an Infinity Stone"
        ],
        "Science" : [
            "Who was the father of evolution?",
            "Which is NOT a state of matter?"
        ]
    ]
    let answerBank : [String : [[String]]] = [
        "Mathematics" : [
            ["4", "124", "2", "9999"],
            ["49", "50", "125", "25"]
        ],
        "Marvel" : [
            ["Infinity Gauntlet", "Eye of Agomotto", "Chituari Scepter", "Mjolnir"],
            ["Mind Stone", "Water Stone", "Death Stone", "Dream Stone"]
        ],
        "Science" : [
            ["Leonardo Di Vinci", "Charles Darwin", "Galileo", "Donald Trump"],
            ["Solid", "Liquid", "Melted", "Gas"]
        ]
    ]
    
    let correctAnswerBank : [String : [Int]] = [
        "Mathematics" : [
            2,
            1
        ],
        "Marvel" : [
            3,
            0
        ],
        "Science" : [
            1,
            2
        ]
    ]
 
    
    @IBAction func settingsAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Settings", message:
            "URL goes here!", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = self.urlString
        }

        alertController.addAction(UIAlertAction(title: "Refresh", style: UIAlertActionStyle.default,handler: { (_) in
            self.urlString = (alertController.textFields?[0].text!)!
            self.getJSON()
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        getJSON()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(QuizTypeViewController.refresh), for: UIControlEvents.valueChanged)
        tableView.addSubview(refresher)
        refresher.endRefreshing()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func refresh() {
        getJSON()
        self.tableView.reloadData()
        refresher.endRefreshing()
    }
    
    func getJSON() {
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error != nil {
                print("Error present")
            } else {
                if let content = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        for i in 0...json.count - 1 {
                            if let current = json[i] as? NSDictionary {
                                if let title = current["title"] {
                                    self.subjects[i] = title as! String
                                }
                                if let desc = current["desc"] {
                                    self.descriptions[i] = desc as! String
                                }
                                if let question = current["questions"] as? NSDictionary {
                                    if let text = question["text"] as? String {
                                        self.questions[i] = text
                                        print(self.questions)
                                    }
                                    if let correctAnswer = question["answer"] as? Int {
                                        self.correctAnswers[i] = correctAnswer
                                        print(self.correctAnswers)
                                    }
                                    if let choices = question["answers"] as? String {
                                        self.answers[i] = choices
                                        print(self.answers)
                                    }
                                }
                            }
                        }
                    } catch {
                        print ("There was an error")
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subjects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath)

        let subject = subjects[indexPath.row]
        cell.textLabel?.text = subject
        cell.detailTextLabel?.text = descriptions[indexPath.row]
        cell.imageView?.image = UIImage(named: subject)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Subject" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPath(for: cell)
            let vc = segue.destination as! QuestionViewController
            let subject = self.subjects[(indexPath?.row)!]
            vc.subjectTitle = subject
            vc.questionSet = questionBank[subject]
            vc.answerSet = answerBank[subject]
            vc.correctAnswers = correctAnswerBank[subject]
            vc.questionIndex = 0
            vc.quizResults = 0
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
