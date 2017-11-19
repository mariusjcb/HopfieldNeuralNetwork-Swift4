//
//  ActivationFunction.swift
//  Hopfield Neural Network
//
//  Created by Marius Ilie on 19/11/2017.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import Foundation

class ActivationFunction {
    class func stepFunction(with value: Double) -> Double {
        if value > 0 {
            return 1.0
        }
        
        return -1.0
    }
}
