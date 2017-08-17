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
            firstOperand = { _ in return EquationGenerator.getRandomInt(min: 0, max: 5) }
            secondOperand = { return EquationGenerator.getRandomInt(min: 0, max: 5) }
            
        case .medium:
            firstOperand = { _ in return EquationGenerator.getRandomInt(min: 0, max: 10) }
            secondOperand = { return EquationGenerator.getRandomInt(min: 0, max: 10) }
            
        case .hard:
            firstOperand = { _ in return EquationGenerator.getRandomInt(min: -30, max: 30) }
            secondOperand = { return EquationGenerator.getRandomInt(min: -30, max: 30) }
            
        case .legendary:
            firstOperand = { _ in return EquationGenerator.getRandomInt(min: -100, max: 100) }
            secondOperand = { return EquationGenerator.getRandomInt(min: -100, max: 100) }
        }
            
        case .multiply:
                switch difficulty {
                case .easy:
                    firstOperand = { _ in return EquationGenerator.getRandomInt(min: 0, max: 3) }
                    secondOperand = { return EquationGenerator.getRandomInt(min: 0, max: 3) }

                case .medium:
                    firstOperand = { _ in return EquationGenerator.getRandomInt(min: 0, max: 6) }
                    secondOperand = { return EquationGenerator.getRandomInt(min: 0, max: 6) }
                    
                case .hard:
                    firstOperand = { _ in return EquationGenerator.getRandomInt(min: 6, max: 12) }
                    secondOperand = { return EquationGenerator.getRandomInt(min: 2, max: 12) }
                    
                case .legendary:
                    firstOperand = { _ in return EquationGenerator.getRandomInt(min: -15, max: 15) }
                    secondOperand = { return EquationGenerator.getRandomInt(min: -15, max: 15) }
            }
            
        case .divide:
            switch difficulty {
            case .easy:
                secondOperand = { return EquationGenerator.getRandomInt(min: 1, max: 3) }
                firstOperand = { x in return x * EquationGenerator.getRandomInt(min: 0, max: 3) }

            case .medium:
                secondOperand = { return EquationGenerator.getRandomInt(min: 1, max: 6) }
                firstOperand = { x in return x * EquationGenerator.getRandomInt(min: 0, max: 6) }

            case .hard:
                secondOperand = { return EquationGenerator.getRandomInt(min: 1, max: 12) }
                firstOperand = { x in return x * EquationGenerator.getRandomInt(min: 6, max: 12) }

            case .legendary:
                secondOperand = { return EquationGenerator.getRandomInt(min: 1, max: 25) }
                firstOperand = { x in return x * EquationGenerator.getRandomInt(min: -25, max: 25) }
            }
        }
    }
    
    var operation : Operation
    
    var difficulty : Difficulty
    
    var firstOperand : (Int) -> Int
    
    var secondOperand : () -> Int
    
    func createEquation() -> Equation {
        let y = secondOperand()
        let x = firstOperand(y)
        return Equation(firstOperand: x, secondOperand: y, operation: operation)
    }
    
    static func getRandomInt(min : Int, max: Int) -> Int {
        let distance = UInt32(max - min)
        return Int(arc4random_uniform(distance)) + min
    }
    
}

