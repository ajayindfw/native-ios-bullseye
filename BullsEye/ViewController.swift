//
//  ViewController.swift
//  BullsEye
//
//  Created by Ajay Gupta on 3/1/15.
//  Copyright (c) 2015 Lennox International. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
        
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert()
    {
        let difference = abs (targetValue - currentValue)
        var points = 100 - difference
        
        var title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        }
        else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        }
        else if difference < 10 {
            title = "Pretty good!"
        }
        else {
            title = "Not even close..."
        }
        
        score += points

        
        let message = "You scored: \(points) points";
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {action in self.startNewRound()
            self.updateLabels() })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider)
    {
        currentValue = lroundf(slider.value)
    }
    
    func startNewGame()
    {
        round = 0
        score = 0
        startNewRound()
    }
    
    @IBAction func startOver()
    {
       startNewGame()
       updateLabels()
    }
    
    func updateLabels()
    {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound()
    {
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        round++
    }
}

