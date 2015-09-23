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
    @IBOutlet weak var cookSlider: UISlider!
    @IBOutlet weak var baconLabel: UILabel!
    @IBOutlet weak var switchControl: UISegmentedControl!
    @IBOutlet weak var instLabel: UILabel!
    @IBOutlet weak var inst: UILabel!

    func showInstructions(){
        if switchControl.selectedSegmentIndex == 0 {
            instLabel.text="Use slider to cook bacon."
           
        }
        else if switchControl.selectedSegmentIndex == 1 {
            instLabel.text=" "

        }
    }
    
    @IBAction func changeText(sender: UISegmentedControl) {
        showInstructions()
    }
    
    
    
    

    @IBAction func baconSlider(sender: UISlider) {
        var currentValue = Int(sender.value)
        if currentValue == 0 {
            baconView.image=UIImage(named: "packaged")
            baconLabel.text = "packaged"
        }
        else if currentValue == 1 {
            baconView.image=UIImage(named: "rawbacon")
            baconLabel.text = "raw"
        }
        else if currentValue == 2{
            baconView.image=UIImage(named: "bacon_1")
            baconLabel.text = "medium raw"
        }
        else if currentValue == 3{
            baconView.image=UIImage(named: "bacon_2")
            baconLabel.text = "medium"
        }
        else if currentValue == 4{
            baconView.image=UIImage(named: "bacon_3")
            baconLabel.text = "burnt"
        }

    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

