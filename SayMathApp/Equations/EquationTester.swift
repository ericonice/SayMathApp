//
//  MathTest.swift
//  SayMath
//
//  Created by Eric Newman on 8/9/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import Foundation

class EquationTester {
    
    init(operation: Operation, difficulty: Difficulty, numberOfQuestions: Int) {
        self.numberOfQuestions = numberOfQuestions
        self.difficulty = difficulty
        self.equationGenerator = EquationGenerator(operation: operation, difficulty: difficulty)
    }
    
    var difficulty : Difficulty
    
    var currentEquation : Equation?
    
    var equationGenerator : EquationGenerator
    
    var numberOfQuestions : Int
    
    var correct = 0
    
    var incorrect = 0
    
    var done : Bool {
        get {
            return answered >= numberOfQuestions
        }
    }
    
    var answered : Int {
        get {
            return correct + incorrect
        }
    }
    
    var currentScore : Int? {
        get {
            if answered != 0 {
                return (100 * correct) / answered
            }
            
            return nil
        }
    }
    
    func getNextEquation() -> Equation? {
        if (done) {
            return nil
        }
        
        currentEquation = equationGenerator.createEquation()
        return currentEquation
    }
    
    func processResult(for result: Int?)
    {
        if (result == self.currentEquation?.result)
        {
            correct = correct + 1
        } else {
            incorrect = incorrect + 1
        }
        
        currentEquation = nil
    }
}

