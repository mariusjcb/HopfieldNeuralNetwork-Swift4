//
//  main.swift
//  Hopfield Neural Network
//
//  Created by Marius Ilie on 19/11/2017.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import Foundation

let p1 = [1, 0, 1, 0.0]
let p2 = [1, 1, 0, 0.0]

let p3 = [1, 0, 1, 1.0]

var hop = HopfieldNetwork(dimension: 4)
hop.train(withPatterns: [p1, p2])

print(hop.check(pattern: p3))
