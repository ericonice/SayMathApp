//
//  MathTestViewController.swift
//  SayMathApp
//
//  Created by Eric Newman on 8/12/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import UIKit

class MathTestViewController: UIViewController {
    @IBOutlet weak var correct: UILabel!
    
    @IBOutlet weak var incorrect: UILabel!
    
    @IBOutlet weak var audio: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var symbol: UILabel!
    
    @IBOutlet weak var firstOperand: UILabel!
    
    @IBOutlet weak var secondOperand: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    var mathTest : EquationTester!
    
    var speechDetector = SpeechDetector()
    
    var timeInSeconds = 0
    
    var timeTicker: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the initial question
        self.getNextEquation()
        self.status.text = nil
        self.audio.text = nil
        self.correct.text = String(mathTest.correct)
        self.incorrect.text = String(mathTest.incorrect)
        timeLabel.text = String(formatTime())
        
        answer.layer.borderWidth = 2.0
        answer.layer.borderColor = UIColor.blue.cgColor
        
        timeTicker = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: updateTime)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timeTicker?.invalidate()
    }
    
    func updateTime(timer : Timer) {
        timeInSeconds = timeInSeconds + 1
        timeLabel.text = String(formatTime())
    }
    
    func formatTime() -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func getNextEquation() {
        if (mathTest.done) {
            showResults()
            return
        }
        
        self.equation = mathTest.getNextEquation()
        
        do {
            try speechDetector.recognizeSpeech(with: updateAnswer, finishWith: doSomething,errorWith: handleError)
            
        } catch {
            self.status.text = error.localizedDescription
        }
    }
    
    func updateAnswer(_ result: String) {
        self.audio.text = result
        
        // Answer is the last word of the current audio
        self.answer.text = result.getLastWord()
        
        // If correct, then automatically get next question
        if let answerAsInt = self.answer?.text?.toInt() {
            if answerAsInt == mathTest.currentEquation?.result {
                self.answer.text = String(answerAsInt)
                speechDetector.stopRecording()
            }
        }
    }

    func doSomething(_ result: String) {
        self.audio.text = result
        self.answer.text = result.getLastWord()
        
        checkAnswer(for: self.answer.text!)
    }
    
    func handleError(_ result: String) {
        self.status.text = result
    }

    var equation : Equation? {
        didSet {
            self.firstOperand.text = String(equation!.firstOperand)
            self.secondOperand.text = String(equation!.secondOperand)
            self.symbol.text = equation!.operation.getSymbol()
            self.answer.text = ""
        }
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        speechDetector.stopRecording()
    }
    
    func checkAnswer(for value: String) {
        
        let answerAsInt = value.toInt()
        
        // Convert to digits (i.e. one to 1)
        if (answerAsInt != nil) {
            self.answer.text = String(answerAsInt!)
        }
        
        mathTest.processResult(for: answerAsInt)
        self.correct.text = String(mathTest.correct)
        self.incorrect.text = String(mathTest.incorrect)
        self.getNextEquation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showResults() {
        let results = "Time: \(timeInSeconds) seconds\nCorrect: \(mathTest.correct)\nIncorrect: \(mathTest.incorrect)\nScore: \(mathTest.currentScore ?? 0)%"
        let alertController = UIAlertController(title: "Results", message: results, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                self.navigationController?.popViewController(animated: true)
        })

        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
