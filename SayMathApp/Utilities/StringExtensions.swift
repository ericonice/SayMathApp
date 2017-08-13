//
//  StringExtensions.swift
//  SayMathApp
//
//  Created by Eric Newman on 8/12/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import Foundation

extension String {
    
    func getLastWord() -> String?
    {
        let split = self.components(separatedBy: " ")
        return split.last
    }
    
    func toInt(from text: String) -> Int? {
        // TODO: Add unit tests
        if let value = Int(text) {
            return value
        }
        
        if let value = Utilities.numberFormatter.number(from: text) {
            return value.intValue
        }
        
        return nil
    }
}
