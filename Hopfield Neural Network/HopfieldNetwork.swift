//
//  HopfieldNetwork.swift
//  Hopfield Neural Network
//
//  Created by Marius Ilie on 19/11/2017.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import Foundation

class HopfieldNetwork {
    private var weights: [[Double]]!
    
    init(dimension: Int) {
        weights = [[Double]](repeating: [Double](repeating: 0, count: dimension), count: dimension)
    }
    
    func train(withPattern pattern: [Double]) {
        var outerProduct = pattern.bipolarPattern().outerProduct()
        outerProduct.clearDiagonal()
        
        weights = weights + outerProduct
    }
    
    func train(withPatterns patterns: [[Double]]) {
        for pattern in patterns {
            train(withPattern: pattern)
        }
    }
    
    func check(pattern: [Double]) -> Bool {
        let bipolarPattern = pattern.bipolarPattern()
        var result = (weights * bipolarPattern).map {
            return ActivationFunction.stepFunction(with: $0)
        }
        
        for i in 0..<pattern.count {
            if result[i] != bipolarPattern[i] {
                return false
            }
        }
        
        return true
    }
}
