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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

