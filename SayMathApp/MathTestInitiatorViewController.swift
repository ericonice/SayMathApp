//
//  MathTestInitiatorViewController.swift
//  SayMathApp
//
//  Created by Eric Newman on 8/11/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import UIKit

class MathTestInitiatorViewController: UIViewController
{
    @IBOutlet weak var operationControl: UISegmentedControl!
    
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let operation = Operation(rawValue: operationControl!.titleForSegment(at: operationControl.selectedSegmentIndex)!)
        let difficulty = Difficulty(rawValue: difficultyControl!.titleForSegment(at: difficultyControl.selectedSegmentIndex)!)
        
        var destinationViewController = segue.destination
        
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        
        if let mathViewTestController = destinationViewController as? MathTestViewController {
            mathViewTestController.mathTest = EquationTester(operation: operation!, difficulty: difficulty!, numberOfQuestions: 10)
        }
    }
    

}
