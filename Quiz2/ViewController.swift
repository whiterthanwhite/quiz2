//
//  ViewController.swift
//  Quiz2
//
//  Created by Vlad Akhpanov on 14.06.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"]
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"]
    var currQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currQuestionIndex]
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currQuestionIndex += 1
        if currQuestionIndex == questions.count {
            currQuestionIndex = 0
        }
        let question: String = questions[currQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        
    }
}

