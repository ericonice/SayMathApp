//
//  EquationGenerator.swift
//  SayMath
//
//  Created by Eric Newman on 8/8/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import Foundation

class EquationGenerator
{
    init(operation : Operation, difficulty : Difficulty) {
        self.operation = operation
        self.difficulty = difficulty
        
        switch operation {
        case .add, .subtract:
        switch difficulty {
        case .easy:
            minOperandValue = 0
            maxOperandValue = 5
        case .medium:
            minOperandValue = 0
            maxOperandValue = 10
        case .hard:
            minOperandValue = -30
            maxOperandValue = 30
        case .legendaray:
            minOperandValue = -100
            maxOperandValue = 100
            }
            
        case .multiply:
                switch difficulty {
                case .easy:
                    minOperandValue = 0
                    maxOperandValue = 3
                case .medium:
                    minOperandValue = 0
                    maxOperandValue = 6
                case .hard:
                    minOperandValue = 0
                    maxOperandValue = 12
                case .legendaray:
                    minOperandValue = -15
                    maxOperandValue = 15
            }
            
        case .divide:
            minOperandValue = 0
            maxOperandValue = 12
        }
    }
    
    var operation : Operation
    
    var difficulty : Difficulty
    
    var minOperandValue = Int(0)
    
    var maxOperandValue = Int(12)
    
    func createEquation() -> Equation {
        let distance = UInt32(maxOperandValue - minOperandValue)
        let firstOperand = Int(arc4random_uniform(distance)) - minOperandValue
        let secondOperand = Int(arc4random_uniform(distance)) - minOperandValue
        return Equation(firstOperand: firstOperand, secondOperand: secondOperand, operation: operation)
    }
    
}

