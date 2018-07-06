//
//  ViewController.swift
//  Quizzler
//
//  Created by Tim Krull on 06/27/2018.
//  Copyright (c) 2018 Tim Krull. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //global variables
	let allQuestions = QuestionBank()
	var pickedAnswer: Bool = false
	var questionNumber: Int = 0
	var score: Int = 0
	
	//Outlets for UI
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
	
	//initialize the view
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//update the question label to the first quesition
		questionLabel.text = allQuestions.list[questionNumber].questionText
		
		//call to update the UI to intial state
		updateUI()
	}//viewDidLoad()


    @IBAction func answerPressed(_ sender: AnyObject) {
		
		//check which answer button the user pressed
		if sender.tag == 1 {
			pickedAnswer = true
		}
		else if sender.tag == 2 {
			pickedAnswer = false
		}
		
		//call to check if the given answer is correct
		checkAnswer()
		
		questionNumber += 1 //increment what number question the user is on
		
		//call to update question label to the next question
		nextQuestion()
		
    }//answerPressed(_ sender: AnyObject)
    
    //updates the UI elements - progress bar, progress label, score label
    func updateUI() {
		//update the score
		scoreLabel.text = "Score: \(score)"
		
		//update the progress label
		progressLabel.text = "\(questionNumber + 1) / \(allQuestions.list.count)"
		
		progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }//updateUI()
    
	//displays the next question
    func nextQuestion() {
		//check that questionNumber within the bounds of the list
		if questionNumber < allQuestions.list.count {
			//update the question label to the next question
			questionLabel.text = allQuestions.list[questionNumber].questionText
			//call to update the UI
			updateUI()
		}
		else {
			//end of quiz alert
			let alert = UIAlertController(title: "You reached the end!", message: "Do you want to take the quiz again?", preferredStyle: .alert)
			
			//restart action for the end of quiz alert
			let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
				self.startOver()
			}
			
			//add action to the alert
			alert.addAction(restartAction)
			
			//present the alert
			present(alert, animated: true, completion: nil)
			
		}
    }//nextQuestion()
    
    //checks if the user's given answer matches the correct answer
    func checkAnswer() {
		
		//check the user's answer against the correct answer
		if allQuestions.list[questionNumber].answer == pickedAnswer {
			ProgressHUD.showSuccess("Correct!")
			score += 1
		}
		else {
			ProgressHUD.showError("Wrong!")
		}
		
    }//checkAnswer()
    
    //reset questionNumber to 0 and update question label
    func startOver() {
		questionNumber = 0
		score = 0
		nextQuestion()
    }//startOver()
    

    
}
