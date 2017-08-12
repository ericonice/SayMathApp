//
//  Equation.swift
//  SayMath
//
//  Created by Eric Newman on 8/8/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

class Equation
{
    init(firstOperand: Int, secondOperand: Int, operation: Operation) {
        self.firstOperand = firstOperand
        self.secondOperand = secondOperand
        self.operation = operation
    }
    
    var firstOperand: Int
    
    var secondOperand: Int
    
    var operation: Operation
    
    var result : Int {
        get {
            return self.operation.getFunction()(firstOperand, secondOperand)
        }
    }
}

