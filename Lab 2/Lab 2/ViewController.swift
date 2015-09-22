//
//  ViewController.swift
//  Lab 2
//
//  Created by Daniel Rankin on 9/22/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var baconView: UIImageView!
    @IBOutlet weak var foodSwitch: UISegmentedControl!
    @IBOutlet weak var cookSlider: UISlider!
    @IBOutlet weak var baconLabel: UILabel!
    
    

    
    @IBAction func baconSlider(sender: UISlider) {
        var currentValue = Int(sender.value)
        
    if currentValue == 0 {
        baconView.image=UIImage(named: "rawbacon")
        baconLabel.text = "raw"
    }
    else if currentValue == 1{
        baconView.image=UIImage(named: "bacon_1")
        baconLabel.text = "medium raw"
    }
    else if currentValue == 2{
        baconView.image=UIImage(named: "bacon_2")
        baconLabel.text = "medium"
    }
    else if currentValue == 3{
        baconView.image=UIImage(named: "bacon_3")
        baconLabel.text = "burnt"
    }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

