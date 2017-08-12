//
//  Operator.swift
//  SayMath
//
//  Created by Eric Newman on 8/9/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import Foundation

enum Operation
{
    case add
    case subtract
    case divide
    case multiply
    
    func getSymbol() -> String {
        switch self {
        case .add:
            return "➕"
        case .subtract:
            return "➖"
        case .divide:
            return "➗"
        case .multiply:
            return "✖️"
        }
    }
    
    func getFunction() -> (Int, Int) -> Int {
        switch self {
        case .add:
            return { $0 + $1 }
        case .subtract:
            return { $0 - $1 }
        case .divide:
            return { $0 / $1 }
        case .multiply:
            return { $0 * $1 }
        }
    }
}

