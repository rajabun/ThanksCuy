//
//  Counter.swift
//  ThanksCuy
//
//  Created by Muhammad Rajab Priharsanto on 17/05/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import Foundation

class Counter
{
    var steps: Int
    var mistakes: Int
    
    init(stepCount: Int, mistakeCount: Int)
    {
        self.steps = stepCount
        self.mistakes = mistakeCount
    }
    
    func increaseStepCount()
    {
        self.steps += 1
    }
    
    func increaseMistakeCount()
    {
        self.mistakes += 1
    }
}
