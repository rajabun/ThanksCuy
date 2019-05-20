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
    
    
    var counterInstance: Counter?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //initiation for class Counter
        counterInstance = Counter(stepCount: 0, mistakeCount: 0, switchCount: 0)
        
        circleShape.layer.cornerRadius = circleShape.frame.width/2
        
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
                topMiddleSwitchOn()
//                if topMiddleSwitch.isOn == false
//                {
//                    instance.decreaseSwitchCount()
//                }
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
                topRightSwitchOn()
//                if topRightSwitch.isOn == false
//                {
//                    instance.decreaseSwitchCount()
//                }
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
                topMiddleSwitchOff()
            }
            else
            {
                instance.decreaseSwitchCount()
            }
            /*
            if topLeftSwitch.isOn == false && topMiddleSwitch.isOn == false
            {
                instance.increaseSwitchCount()
                instance.increaseSwitchCount()
            }
             */
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
//                if bottomMiddleSwitch.isOn == true
//                {
//                    instance.increaseSwitchCount()
//                }
                bottomRightSwitchOff()
//                if bottomRightSwitch.isOn == true
//                {
//                    instance.increaseSwitchCount()
//                }
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
//                if topLeftSwitch.isOn == true
//                {
//                    instance.increaseSwitchCount()
//                }
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
                bottomMiddleSwitchOn()
//                if bottomMiddleSwitch.isOn == false
//                {
//                    instance.decreaseSwitchCount()
//                }
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
    
    func topLeftSwitchOn()
    {
        if let instance = counterInstance
        {
            if topLeftSwitch.isOn == false
            {
                topLeftSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
            else
            {
                
            }
        }
    }
    
    func topLeftSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            if topLeftSwitch.isOn == false
            {
                //instance.increaseSwitchCount()
            }
            else
            {
                topLeftSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
            //topLeftSwitch.setOn(false, animated: true)
            //instance.decreaseSwitchCount()
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
            else
            {
                //instance.decreaseSwitchCount()
            }
        }
    }
    
    func topMiddleSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            if topMiddleSwitch.isOn == false
            {
                //instance.increaseSwitchCount()
            }
            else
            {
                topMiddleSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
            //topMiddleSwitch.setOn(false, animated: true)
            //instance.decreaseSwitchCount()
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
            else
            {
                
            }
        }
    }
    
    func topRightSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            if topRightSwitch.isOn == false
            {
                //instance.increaseSwitchCount()
            }
            else
            {
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
            else
            {
                
            }
        }
    }
    
    func bottomLeftSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            if bottomLeftSwitch.isOn == false
            {
                //instance.increaseSwitchCount()
            }
            else
            {
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
            mistakeAnimation()
            if bottomMiddleSwitch.isOn == false
            {
                //instance.increaseSwitchCount()
            }
            else
            {
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
            else
            {
                
            }
        }
    }
    
    func bottomRightSwitchOff()
    {
        if let instance = counterInstance
        {
            mistakeAnimation()
            if bottomRightSwitch.isOn == false
            {
                //instance.increaseSwitchCount()
            }
            else
            {
                bottomRightSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
    
    func mistakeAnimation()
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
    
    func setSwitchColor()
    {
        topLeftSwitch.onTintColor = #colorLiteral(red: 0.9421673417, green: 0.9228832722, blue: 0.031715855, alpha: 1)
        
    }
}

