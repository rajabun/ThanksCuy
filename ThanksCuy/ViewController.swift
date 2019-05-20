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
    @IBOutlet weak var circleShape: UIButton!
    var currentAnimation = 0
    
    var counterInstance: Counter?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //initiation for class Counter
        counterInstance = Counter(stepCount: 0, mistakeCount: 0, switchCount: 0)
        
        circleShape.layer.cornerRadius = circleShape.frame.width/2
        
        //update ui after initiation
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
        moreThanTenSteps()
        if let instance = counterInstance
        {
            if topLeftSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                view.backgroundColor = .blue
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
            }
            else
            {
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
                topMiddleSwitchOff()
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
                bottomMiddleSwitchOff()
                bottomRightSwitchOff()
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
                bottomLeftSwitchOff()
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
            }
            else
            {
                instance.decreaseSwitchCount()
            }
            instance.increaseStepCount()
        }
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
    
    func topLeftSwitchOn()
    {
        if let instance = counterInstance
        {
            if topLeftSwitch.isOn == false
            {
                topLeftSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
        }
    }
    
    func topLeftSwitchOff()
    {
        if let instance = counterInstance
        {
            if topLeftSwitch.isOn == true
            {
                mistakeApplied()
                topLeftSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
    
    func topMiddleSwitchOn()
    {
        if let instance = counterInstance
        {
            if topMiddleSwitch.isOn == false
            {
                topMiddleSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
        }
    }
    
    func topMiddleSwitchOff()
    {
        if let instance = counterInstance
        {
           if topMiddleSwitch.isOn == true
            {
                mistakeApplied()
                topMiddleSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
    
    func topRightSwitchOn()
    {
        if let instance = counterInstance
        {
            if topRightSwitch.isOn == false
            {
                topRightSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
        }
    }
    
    func topRightSwitchOff()
    {
        if let instance = counterInstance
        {
           if topRightSwitch.isOn == true
            {
                mistakeApplied()
                topRightSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
    
    func bottomLeftSwitchOn()
    {
        if let instance = counterInstance
        {
            if bottomLeftSwitch.isOn == false
            {
                bottomLeftSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
        }
    }
    
    func bottomLeftSwitchOff()
    {
        if let instance = counterInstance
        {
            if bottomLeftSwitch.isOn == true
            {
                mistakeApplied()
                bottomLeftSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
    
    func bottomMiddleSwitchOn()
    {
        if let instance = counterInstance
        {
            if bottomMiddleSwitch.isOn == false
            {
                bottomMiddleSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
        }
    }
    
    func bottomMiddleSwitchOff()
    {
        if let instance = counterInstance
        {
            if bottomMiddleSwitch.isOn == true
            {
                mistakeApplied()
                bottomMiddleSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
           }
        }
    }
    
    func bottomRightSwitchOn()
    {
        if let instance = counterInstance
        {
            if bottomRightSwitch.isOn == false
            {
                bottomRightSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
        }
    }
    
    func bottomRightSwitchOff()
    {
        if let instance = counterInstance
        {
            //mistakeAnimation()
            if bottomRightSwitch.isOn == true
            {
                mistakeApplied()
                bottomRightSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
                //instance.increaseMistakeCount()
            }
        }
    }
    
    func mistakeLabelAnimation()
    {
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:
            {
            self.mistakesLabel.transform = CGAffineTransform(scaleX: 3, y: 3)
            }, completion:
                { finish in
                    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:
                        {
                            self.mistakesLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                        }, completion: nil)
                })
    }
    
    func mistakeApplied()
    {
        if let instance = counterInstance
        {
            mistakeLabelAnimation()
            instance.increaseMistakeCount()
            UIView.animate(withDuration: 1)
            {
                switch self.currentAnimation
                {
                    case 0:
                        self.circleShape.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    case 1:
                        self.circleShape.transform = CGAffineTransform(scaleX: 2, y: 2)
                    case 2:
                        self.circleShape.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
                    case 3:
                        self.circleShape.transform = CGAffineTransform(scaleX: 3, y: 3)
                    case 4:
                        self.circleShape.transform = CGAffineTransform(scaleX: 3.5, y: 3.5)
                    case 5:
                        self.circleShape.transform = CGAffineTransform(scaleX: 4, y: 4)
                    case 6:
                        self.circleShape.transform = CGAffineTransform(scaleX: 4.5, y: 4.5)
                    case 7:
                        self.circleShape.transform = CGAffineTransform(scaleX: 5, y: 5)
                    default:
                        break
                }
            }
        }
        self.currentAnimation += 1
        if self.currentAnimation > 7
        {
            self.currentAnimation = 0
        }
        print(self.currentAnimation)
    }
    
    func setSwitchColor()
    {
        topLeftSwitch.onTintColor = #colorLiteral(red: 0.9421673417, green: 0.9228832722, blue: 0.031715855, alpha: 1)
        
    }
}

