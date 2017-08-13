//
//  Utilities.swift
//  SayMath
//
//  Created by Eric Newman on 8/9/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import Foundation

class Utilities {
    
    static let numberFormatter = {
        () -> NumberFormatter in
        var formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter
    }()
}

