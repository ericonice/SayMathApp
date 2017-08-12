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
    init(operation : Operation) {
        self.operation = operation
    }
    
    var operation : Operation
    
    var difficulty = 0
    
    var minOperandValue = UInt32(0)
    
    var maxOperandValue = UInt32(12)
    
    func createEquation() -> Equation {
        let firstOperand = Int(arc4random_uniform(maxOperandValue) + minOperandValue)
        let secondOperand = Int(arc4random_uniform(maxOperandValue) + minOperandValue)
        return Equation(firstOperand: firstOperand, secondOperand: secondOperand, operation: operation)
    }
    
}

