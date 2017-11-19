//
//  Array.swift
//  Hopfield Neural Network
//
//  Created by Marius Ilie on 19/11/2017.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import Foundation

extension Array where Element == Double {
    func bipolarPattern() -> [Double] {
        return map {
            if $0 == 0 {
                return -1
            }
            
            return 1
        }
    }
    
    func outerProduct() -> [[Double]] {
        var product = [[Double]](repeating: [Double](repeating: 0, count: self.count), count: self.count)
        
        for i in 0..<self.count {
            for j in 0..<self.count {
                product[i][j] = self[i] * self[j]
            }
        }
        
        return product
    }
}

extension Array where Element == Array<Double> {
    mutating func clearDiagonal() {
        for i in 0..<self.count {
            self[i][i] = 0
        }
    }
}

func +(left: [[Double]], right: [[Double]]) -> [[Double]] {
    var sum = [[Double]](repeating: [Double](repeating: 0, count: left.count), count: left.count)
    
    for i in 0..<left.count {
        for j in 0..<left.count {
            sum[i][j] = left[i][j] + right[i][j]
        }
    }
    
    return sum
}

func *(left: [[Double]], right: [Double]) -> [Double] {
    var result = [Double](repeating: 0, count: left.count)
    
    for i in 0..<left.count {
        var sum: Double = 0
        
        for j in 0..<left.count {
            sum += left[i][j] * right[j]
        }
        
        result[i] = sum;
    }
    
    return result
}
