//
//  ViewController.swift
//  Quizzler
//
//  Created by Tatiana Zudina on 17.04.2023.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var questionLabel: UILabel!
	@IBOutlet weak var progressBar: UIProgressView!
	@IBOutlet weak var trueButton: UIButton!
	@IBOutlet weak var falseButton: UIButton!
	
	var quizBrain = QuizBrain()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		trueButton.layer.cornerRadius = 10
		trueButton.layer.borderColor = UIColor(red: 240.0/255.0, green: 235.0/255.0, blue: 141.0/255.0, alpha: 1.0).cgColor
		trueButton.layer.borderWidth = 2
		
		falseButton.layer.cornerRadius = 10
		falseButton.layer.borderColor = UIColor(red: 240.0/255.0, green: 235.0/255.0, blue: 141.0/255.0, alpha: 1.0).cgColor
		falseButton.layer.borderWidth = 2
		
		updateUI()
	}
	
	@IBAction func answerButtonPressed(_ sender: UIButton) {
		
		let userAnswer = sender.currentTitle!
		let userGotItRight = quizBrain.checkAnswer(userAnswer)
		
		if userGotItRight {
			sender.backgroundColor = UIColor.green
		} else {
			sender.backgroundColor = UIColor.red
		}
		
		quizBrain.nextQuestion()
		
		Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
	}
	
	@objc func updateUI() {
		questionLabel.text = quizBrain.getQuestionText()
		progressBar.progress = quizBrain.getProgress()
		scoreLabel.text = "Score: \(quizBrain.getScore())"
		trueButton.backgroundColor = UIColor.clear
		falseButton.backgroundColor = UIColor.clear
		
	}
	
}

