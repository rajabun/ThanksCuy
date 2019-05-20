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
        counterInstance = Counter(stepCount: 0, mistakeCount: 0, switchCount: 0)
        
        //update ui after initiation
        setSwitchColor()
        updateUI()
    }
    
    func updateUI()
    {
        if let instance = counterInstance
        {
            mistakesLabel.text = "\(instance.switches)"
            stepLabel.text = "\(instance.steps)"
        }
    }

    @IBAction func topLeftSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if topLeftSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                view.backgroundColor = .blue
                topMiddleSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
                if topMiddleSwitch.isOn == false
                {
                    instance.decreaseSwitchCount()
                }
            }
            else
            {
                instance.decreaseSwitchCount()
            }
            instance.increaseStepCount()
        }
        
        updateUI()
    }
    
    @IBAction func topMiddleSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if topMiddleSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                view.backgroundColor = .yellow
                topRightSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
                if topRightSwitch.isOn == false
                {
                    instance.decreaseSwitchCount()
                }
            }
            else
            {
                //topLeftSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func topRightSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if topRightSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                view.backgroundColor = .white
                topLeftSwitchOff()
                if topLeftSwitch.isOn == true
                {
                    instance.increaseSwitchCount()
                }
                topMiddleSwitchOff()
                if topMiddleSwitch.isOn == true
                {
                    instance.increaseSwitchCount()
                }
            }
            else
            {
                instance.decreaseSwitchCount()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func bottomLeftSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if bottomLeftSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                view.backgroundColor = .blue
                bottomMiddleSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
                if bottomMiddleSwitch.isOn == true
                {
                    instance.increaseSwitchCount()
                }
                bottomRightSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
                if bottomRightSwitch.isOn == true
                {
                    instance.increaseSwitchCount()
                }
            }
            else
            {
                instance.decreaseSwitchCount()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func bottomMiddleSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if bottomMiddleSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                view.backgroundColor = .blue
                bottomLeftSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
                if topLeftSwitch.isOn == true
                {
                    instance.increaseSwitchCount()
                }
            }
            else
            {
                instance.decreaseSwitchCount()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func bottomRightSwitchClicked(_ sender: UISwitch)
    {
        if let instance = counterInstance
        {
            if bottomRightSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                view.backgroundColor = .blue
                bottomMiddleSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
                if bottomMiddleSwitch.isOn == false
                {
                    instance.decreaseSwitchCount()
                }
            }
            else
            {
                instance.decreaseSwitchCount()
            }
            instance.increaseStepCount()
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
    
    func fiveSwitchOn()
    {
        if let instance = counterInstance
        {
            if instance.switches > 5
            {
                allOff()
                instance.switches = 0
            }
        }
    }
    
    func moreThanTenSteps()
    {
        if let instance = counterInstance
        {
            if instance.steps > 10
            {
                allOn()
            }
        }
    }
    
    func topLeftSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            topLeftSwitch.setOn(false, animated: true)
            instance.decreaseSwitchCount()
        }
    }
    
    func topMiddleSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            topMiddleSwitch.setOn(false, animated: true)
            instance.decreaseSwitchCount()
        }
    }
    
    func topRightSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            topRightSwitch.setOn(false, animated: true)
            instance.decreaseSwitchCount()
        }
    }
    
    func bottomLeftSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            bottomLeftSwitch.setOn(false, animated: true)
            instance.decreaseSwitchCount()
        }
    }
    
    func bottomMiddleSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            bottomMiddleSwitch.setOn(false, animated: true)
            instance.decreaseSwitchCount()
        }
    }
    
    func bottomRightSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            bottomRightSwitch.setOn(false, animated: true)
            instance.decreaseSwitchCount()
        }
    }
    
    func mistakeAnimation()
    {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations:
            {
            self.mistakesLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
            }, completion:
                { finish in
                    UIView.animate(withDuration: 1, delay: 0, options: [], animations:
                        {
                            self.mistakesLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                        }, completion: nil)
                })
    }
    
    func setSwitchColor()
    {
        topLeftSwitch.onTintColor = #colorLiteral(red: 0.9421673417, green: 0.9228832722, blue: 0.031715855, alpha: 1)
        
    }
}

