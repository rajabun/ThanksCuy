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
    var switches: Int
    
    init(stepCount: Int, mistakeCount: Int, switchCount: Int)
    {
        self.steps = stepCount
        self.mistakes = mistakeCount
        self.switches = switchCount
    }
    
    func increaseStepCount()
    {
        self.steps += 1
    }
    
    func decreaseStepCount()
    {
        self.steps -= 1
    }
    
    func increaseMistakeCount()
    {
        self.mistakes += 1
    }
    
    func decreaseMistakeCount()
    {
        self.mistakes -= 1
    }
    
    func increaseSwitchCount()
    {
        self.switches += 1
    }
    
    func decreaseSwitchCount()
    {
        self.switches -= 1
    }
}
