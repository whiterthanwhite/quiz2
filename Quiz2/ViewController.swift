//
//  ViewController.swift
//  Quiz2
//
//  Created by Vlad Akhpanov on 14.06.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currQuestionLabel: UILabel!
    @IBOutlet var currQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
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
        currQuestionLabel.text = questions[currQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currQuestionIndex += 1
        if currQuestionIndex == questions.count {
            currQuestionIndex = 0
        }
        let question: String = questions[currQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransition()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        
    }
    
    func animateLabelTransition() {
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                            self.currQuestionLabel.alpha = 0
                            self.nextQuestionLabel.alpha = 1
            
                            self.view.layoutIfNeeded()
                        },
                       completion: { _ in
                            swap(&self.currQuestionLabel, &self.nextQuestionLabel)
                            swap(&self.currQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
            
                            self.updateOffScreenLabel()
                        }
        )
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}

