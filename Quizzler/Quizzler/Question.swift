//
//  Question.swift
//  Quizzler
//
//  Created by Tim Krull on 6/28/18.
//  Copyright © 2018 Tim Krull. All rights reserved.
//

import Foundation

class Question {
	
	let questionText: String //the question being asked
	let answer: Bool //the answer to the question being asked
	
	init(text: String, correctAnswer: Bool) {
		questionText = text
		answer = correctAnswer
	}//init(text: String, correctAnswer: Bool)
	
}//Question
