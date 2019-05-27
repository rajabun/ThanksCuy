//
//  ViewController.swift
//  ThanksCuy
//
//  Created by Muhammad Rajab Priharsanto on 17/05/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    @IBOutlet weak var topLeftSwitch: UISwitch!
    @IBOutlet weak var topMiddleSwitch: UISwitch!
    @IBOutlet weak var topRightSwitch: UISwitch!
    @IBOutlet weak var bottomLeftSwitch: UISwitch!
    @IBOutlet weak var bottomMiddleSwitch: UISwitch!
    @IBOutlet weak var bottomRightSwitch: UISwitch!
    @IBOutlet weak var mistakesLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var circleShape: UIButton!
    @IBOutlet weak var mistakeIcon: UIImageView!
    var currentMistakeAnimation = 0
    
    var counterInstance: Counter?
    var player: AVAudioPlayer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //initiation for class Counter
        counterInstance = Counter(stepCount: 0, mistakeCount: 0, switchCount: 0)
        
        mistakesLabel.removeFromSuperview()
        stepLabel.removeFromSuperview()
        //circleShape.layer.cornerRadius = circleShape.frame.width/2
        /*
        //Play a background audio
        
        */
        //update ui after initiation
        updateUI()
    }
    
    func updateUI()
    {
        if let instance = counterInstance
        {
            //mistakesLabel.text = "\(instance.mistakes)"
            //stepLabel.text = "\(instance.steps)"
            
            if instance.mistakes > 5
            {
                /*
                UIView.transition(with: circleShape.titleLabel!, duration: 3, options: .transitionCrossDissolve, animations:
                    {
                        self.circleShape.setTitleColor(.white, for: .normal)
                    }, completion: nil)
                //circleShape.setTitleColor(.white, for: .normal)
                 //circleShape.addTarget(self, action: #selector(circleButtonClicked(_:)), for: .touchUpInside)
                 //view.addSubview(circleShape)
                 //self.circleShape.transform = CGAffineTransform(scaleX: 1, y: 1)
                 //if circleShape.isTouchInside == true
                 //self.circleShape.layer.removeAllAnimations()
                 */
                allOn()
                self.circleShape.setImage(UIImage(named: "Happy-Icon"), for: .normal)
                    UIView.animate(withDuration: 1, delay: 0.5, options: [.autoreverse], animations:
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }, completion: nil)
            }
        }
    }

    func audioPlay()
    {
        let path = Bundle.main.path(forResource: "Joy & Calm", ofType: "m4a")!
        let url = URL(fileURLWithPath: path)
        
        do
        {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.numberOfLoops = 5
        }
        catch
        {
            // couldn't load file :(
            print(error)
        }
    }
    
    func audioClick()
    {
        let path = Bundle.main.path(forResource: "Switch-Click", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do
        {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        catch
        {
            // couldn't load file :(
            print(error)
        }
        //free license audio by : http://soundbible.com/1705-Click2.html
    }
    
    @IBAction func circleButtonClicked(_ sender: UIButton)
    {
        print("Smile Button Pressed")
        if let instance = counterInstance
        {
            if instance.mistakes > 5
            {
                //allOn()
                
                UIView.animate(withDuration: 2)
                {
                    self.view.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.3098039216, blue: 0.5019607843, alpha: 1)
                }
                audioPlay()
            }
        }
        updateUI()
    }
    
    
    @IBAction func topLeftSwitchClicked(_ sender: UISwitch)
    {
        audioClick()
        if let instance = counterInstance
        {
            if topLeftSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                //view.backgroundColor = .blue
                topMiddleSwitchOnOff()
            }
            else
            {
                instance.decreaseSwitchCount()
                topRightSwitchOnOff()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func topMiddleSwitchClicked(_ sender: UISwitch)
    {
        audioClick()
        if let instance = counterInstance
        {
            if topMiddleSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                //view.backgroundColor = .yellow
                topRightSwitchOnOff()
            }
            else
            {
                instance.decreaseSwitchCount()
                topLeftSwitchOnOff()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func topRightSwitchClicked(_ sender: UISwitch)
    {
        audioClick()
        if let instance = counterInstance
        {
            if topRightSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                //view.backgroundColor = .white
                topLeftSwitchOnOff()
            }
            else
            {
                instance.decreaseSwitchCount()
                topMiddleSwitchOnOff()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func bottomLeftSwitchClicked(_ sender: UISwitch)
    {
        audioClick()
        if let instance = counterInstance
        {
            if bottomLeftSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                //view.backgroundColor = .blue
                bottomRightSwitchOnOff()
            }
            else
            {
                instance.decreaseSwitchCount()
                bottomMiddleSwitchOnOff()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func bottomMiddleSwitchClicked(_ sender: UISwitch)
    {
        audioClick()
        if let instance = counterInstance
        {
            if bottomMiddleSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                //view.backgroundColor = .blue
                bottomLeftSwitchOnOff()
            }
            else
            {
                instance.decreaseSwitchCount()
                bottomRightSwitchOnOff()
            }
            instance.increaseStepCount()
        }
        updateUI()
    }
    
    @IBAction func bottomRightSwitchClicked(_ sender: UISwitch)
    {
        audioClick()
        if let instance = counterInstance
        {
            if bottomRightSwitch.isOn == true
            {
                instance.increaseSwitchCount()
                //view.backgroundColor = .blue
                bottomMiddleSwitchOnOff()
            }
            else
            {
                instance.decreaseSwitchCount()
                bottomLeftSwitchOnOff()
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
    
    func topLeftSwitchOnOff()
    {
        if let instance = counterInstance
        {//Switch On
            if topLeftSwitch.isOn == false
            {
                stepApplied()
                topLeftSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
         //Switch Off
            //else if topLeftSwitch.isOn == true
            else
            {
                mistakeApplied()
                topLeftSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
    
    func topMiddleSwitchOnOff()
    {
        if let instance = counterInstance
        {//Switch On
            if topMiddleSwitch.isOn == false
            {
                stepApplied()
                topMiddleSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
         //Switch Off
            //else if topMiddleSwitch.isOn == true
            else
            {
                mistakeApplied()
                topMiddleSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
    
    func topRightSwitchOnOff()
    {
        if let instance = counterInstance
        {//Switch On
            if topRightSwitch.isOn == false
            {
                stepApplied()
                topRightSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
         //Switch Off
            //else if topRightSwitch.isOn == true
            else
            {
                mistakeApplied()
                topRightSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
    
    func bottomLeftSwitchOnOff()
    {
        if let instance = counterInstance
        {//Switch On
            if bottomLeftSwitch.isOn == false
            {
                stepApplied()
                bottomLeftSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
         //Switch Off
            //else if bottomLeftSwitch.isOn == true
            else
            {
                mistakeApplied()
                bottomLeftSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }

    func bottomMiddleSwitchOnOff()
    {
        if let instance = counterInstance
        {//Switch On
            if bottomMiddleSwitch.isOn == false
            {
                stepApplied()
                bottomMiddleSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
         //Switch Off
            //else if bottomMiddleSwitch.isOn == true
            else
            {
                mistakeApplied()
                bottomMiddleSwitch.setOn(false, animated: true)
                instance.decreaseSwitchCount()
            }
        }
    }
 
    func bottomRightSwitchOnOff()
    {
        if let instance = counterInstance
        {//Switch On
            if bottomRightSwitch.isOn == false
            {
                stepApplied()
                bottomRightSwitch.setOn(true, animated: true)
                instance.increaseSwitchCount()
            }
         //Switch Off
            //mistakeAnimation()
            //else if bottomRightSwitch.isOn == true
            else
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
        self.circleShape.setImage(UIImage(named: "Sad-Icon"), for: .normal)
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:
            {
            //self.mistakesLabel.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.mistakeIcon.transform = CGAffineTransform(scaleX: 2, y: 2)
            }, completion:
                { finish in
                    UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:
                        {
                            //self.mistakesLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
                            self.mistakeIcon.transform = CGAffineTransform(scaleX: 1, y: 1)
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
                //self.view.backgroundColor = .white
                switch self.currentMistakeAnimation
                {
                    case 0:
                        self.circleShape.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                        //self.circleShape.titleLabel?.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
                        //self.circleShape.titleLabel?.adjustsFontSizeToFitWidth = true
                        //self.circleShape.titleLabel?.font = self.circleShape.titleLabel?.font.withSize(11)
                        //self.circleShape.titleLabel?.font = UIFont.systemFont(ofSize: 11)
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
                self.currentMistakeAnimation += 1
                if self.currentMistakeAnimation > 7
                {
                    self.currentMistakeAnimation = 0
                }
                //print("Circle Mistake Animation = ", self.currentMistakeAnimation)
                //print("Font Size = ", self.circleShape.titleLabel?.font)
            }
        }
    }
    
    func stepApplied()
    {
        self.circleShape.setImage(UIImage(named: "Smile-Icon"), for: .normal)
        UIView.animate(withDuration: 1)
            {
                //self.view.backgroundColor = .white
                    //self.currentStepAnimation += 1
                    if self.currentMistakeAnimation == 8
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 4.5, y: 4.5)
                    }
                    else if self.currentMistakeAnimation == 7
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 4, y: 4)
                    }
                    else if self.currentMistakeAnimation == 6
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 3.5, y: 3.5)
                    }
                    else if self.currentMistakeAnimation == 5
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 3, y: 3)
                    }
                    else if self.currentMistakeAnimation == 4
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
                    }
                    else if self.currentMistakeAnimation == 3
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 2, y: 2)
                    }
                    else if self.currentMistakeAnimation == 2
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                    }
                    else if self.currentMistakeAnimation == 1
                    {
                        self.circleShape.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }
                print("Current Mistake Animation = ", self.currentMistakeAnimation)
            }
    }
    
}

