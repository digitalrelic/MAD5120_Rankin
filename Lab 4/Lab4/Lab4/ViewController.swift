//
//  ViewController.swift
//  Lab4
//
//  Created by Daniel Rankin on 10/13/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var delta = CGPointMake(5,0)
    var timer = NSTimer()
    var translation = CGPointMake(0.0, 0.0)
    var angle:CGFloat=0.0
    var turnSpeed:CGFloat=0.2
    

    
    
    

    @IBOutlet weak var speedButton: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func speedAction(sender: AnyObject) {
        if speedButton.selectedSegmentIndex == 0 {
            turnSpeed = 0.05
        }
        if speedButton.selectedSegmentIndex == 1 {
            turnSpeed = 0.1
        }
        if speedButton.selectedSegmentIndex == 2 {
            turnSpeed = 0.3
        }
   
    }

    

    
    
    func moveImage() {
        let duration=Int(speedButton.selectedSegmentIndex)
        UIView.beginAnimations("mrBacon", context: nil)
        self.imageView.transform = CGAffineTransformMakeRotation(self.angle)
        UIView.commitAnimations()
        
        angle += turnSpeed
        if angle >= 0.6 || angle <= -0.6 {
            turnSpeed *= -1
        }
        
        
       

        
        
        
        
        
    }
    
    override func viewDidLoad() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: "moveImage", userInfo: nil, repeats: true)
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

