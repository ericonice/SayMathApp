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
    
    func toInt() -> Int? {
        if let value = Int(self) {
            return value
        }
        
        let normalized = self.lowercased()
        if let value = Utilities.numberFormatter.number(from: normalized) {
            return value.intValue
        }
        
        return nil
    }
}
