//
//  ViewController.swift
//  ThanksCuy
//
//  Created by Muhammad Rajab Priharsanto on 17/05/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLeftSwitch: UISwitch!
    @IBOutlet weak var topMiddleSwitch: UISwitch!
    @IBOutlet weak var topRightSwitch: UISwitch!
    @IBOutlet weak var bottomLeftSwitch: UISwitch!
    @IBOutlet weak var bottomMiddleSwitch: UISwitch!
    @IBOutlet weak var bottomRightSwitch: UISwitch!
    @IBOutlet weak var mistakesLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    
    var counterInstance: Counter?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //initiation for class Counter
        counterInstance = Counter(stepCount: 0, mistakeCount: 0)
        
        //update ui after initiation
        setSwitchColor()
        updateUI()
    }
    
    func updateUI()
    {
        if let instance = counterInstance
        {
            mistakesLabel.text = "\(instance.mistakes)"
            stepLabel.text = "\(instance.steps)"
        }
    }

    @IBAction func topLeftSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if instance.steps > 10
            {
                allOn()
            }
            
            if topLeftSwitch.isOn == true
            {
                view.backgroundColor = .blue
                topMiddleSwitch.setOn(true, animated: true)
                instance.increaseStepCount()
            }
            else
            {
                instance.increaseStepCount()
            }
        }
        
        updateUI()
    }
    
    @IBAction func topMiddleSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if instance.steps > 10
            {
                allOn()
            }
            
            if topMiddleSwitch.isOn == true
            {
                view.backgroundColor = .yellow
                topLeftSwitch.setOn(false, animated: true)
                instance.increaseStepCount()
            }
            else
            {
                instance.increaseStepCount()
            }
        }
        updateUI()
    }
    
    @IBAction func topRightSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if instance.steps > 10
            {
                allOn()
            }
            
            if topRightSwitch.isOn == true
            {
                view.backgroundColor = .white
                topMiddleSwitch.setOn(true, animated: true)
                instance.increaseStepCount()
            }
            else
            {
                instance.increaseStepCount()
            }
        }
        updateUI()
    }
    
    @IBAction func bottomLeftSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if instance.steps > 10
            {
                allOff()
            }
            
            if bottomLeftSwitch.isOn == true
            {
                view.backgroundColor = .blue
                topMiddleSwitch.setOn(true, animated: true)
                instance.increaseStepCount()
            }
            else
            {
                instance.increaseStepCount()
            }
        }
        updateUI()
    }
    
    @IBAction func bottomMiddleSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if instance.steps > 10
            {
                allOn()
            }
            
            if bottomMiddleSwitch.isOn == true
            {
                view.backgroundColor = .blue
                topMiddleSwitch.setOn(true, animated: true)
                instance.increaseStepCount()
            }
            else
            {
                instance.increaseStepCount()
            }
        }
        updateUI()
    }
    
    @IBAction func bottomRightSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if instance.steps > 10
            {
                allOn()
            }
            if bottomRightSwitch.isOn == true
            {
                view.backgroundColor = .blue
                topMiddleSwitch.setOn(true, animated: true)
                instance.increaseStepCount()
            }
            else
            {
                instance.increaseStepCount()
            }
        }
        updateUI()
    }
    
    
    func buildShape()
    {
        if topLeftSwitch.isOn == true
        {
            
            
        }
        //update ui after initiation
        updateUI()
    }
    
    func allOn()
    {
        topLeftSwitch.setOn(true, animated: true)
        topMiddleSwitch.setOn(true, animated: true)
        topRightSwitch.setOn(true, animated: true)
        bottomLeftSwitch.setOn(true, animated: true)
        bottomMiddleSwitch.setOn(true, animated: true)
        bottomRightSwitch.setOn(true, animated: true)
    }
    
    func allOff()
    {
        topLeftSwitch.setOn(false, animated: true)
        topMiddleSwitch.setOn(false, animated: true)
        topRightSwitch.setOn(false, animated: true)
        bottomLeftSwitch.setOn(false, animated: true)
        bottomMiddleSwitch.setOn(false, animated: true)
        bottomRightSwitch.setOn(false, animated: true)
    }
    
    func setSwitchColor()
    {
        topLeftSwitch.onTintColor = #colorLiteral(red: 0.9421673417, green: 0.9228832722, blue: 0.031715855, alpha: 1)
        
    }
}

