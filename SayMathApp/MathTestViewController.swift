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
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var symbol: UILabel!
    
    @IBOutlet weak var firstOperand: UILabel!
    
    @IBOutlet weak var secondOperand: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    var equationTester : EquationTester?
    
    var equation : Equation? {
        didSet {
            self.firstOperand.text = String(equation!.firstOperand)
            self.secondOperand.text = String(equation!.secondOperand)
            self.symbol.text = equation!.operation.getSymbol()
            self.answer.text = ""
            self.correct.text = String(equationTester!.correct)
            self.incorrect.text = String(equationTester!.incorrect)
        }
    }
    
    
    
    @IBAction func nextQuestion(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
