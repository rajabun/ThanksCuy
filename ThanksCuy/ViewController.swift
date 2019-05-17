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
        
        letsPlay()
        
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
        if topLeftSwitch.isOn == true
        {
            view.backgroundColor = .blue
            topMiddleSwitch.setOn(true, animated: true)
            if let instance = counterInstance
            {
                instance.increaseStepCount()
            }
        }
        updateUI()
    }
    
    @IBAction func topMiddleSwitchClicked(_ sender: UISwitch)
    {
        
    }
    
    @IBAction func topRightSwitchClicked(_ sender: UISwitch)
    {
        
    }
    
    @IBAction func bottomLeftSwitchClicked(_ sender: UISwitch)
    {
        
    }
    
    @IBAction func bottomMiddleSwitchClicked(_ sender: UISwitch)
    {
        
    }
    
    @IBAction func bottomRightSwitchClicked(_ sender: UISwitch)
    {
        
    }
    
    
    func letsPlay()
    {
        if topLeftSwitch.isOn == true
        {
            
            
        }
        //update ui after initiation
        updateUI()
    }
    
    
    
}

