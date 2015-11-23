//
//  ViewController.swift
//  Midterm
//
//  Created by Daniel Rankin on 10/29/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITextFieldDelegate {

    var mph : Float = 20.0
    var gasMileage : Float = 24.0
    var gasMultiplier : Float = 1.0
    var waitMultiplier : Float = 0.0
    
    @IBOutlet weak var mileageField: UITextField!
    @IBOutlet weak var totalCommute: UILabel!
    @IBOutlet weak var gasToPurchase: UILabel!
    @IBOutlet weak var transitTypeControl: UISegmentedControl!
    @IBOutlet weak var imageDisplay: UIImageView!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func updateTransit(){
        if transitTypeControl.selectedSegmentIndex == 0 {
            imageDisplay.image = UIImage(named: "car_icon")
            mph = 20.0
            gasMultiplier = 1
            waitMultiplier = 0
        }
        else if transitTypeControl.selectedSegmentIndex == 1 {
            imageDisplay.image = UIImage(named: "bus_icon")
            mph = 12.0
            gasMultiplier = 0
            waitMultiplier = 10
        }
        else if transitTypeControl.selectedSegmentIndex == 2 {
            imageDisplay.image = UIImage(named: "bike_icon")
            mph = 10.0
            gasMultiplier = 0
            waitMultiplier = 0
        }
    }

    func refreshUI(){
        mileageField.text = "0"
    }
    func updateCommuteTime(){
        let mileage = (mileageField.text! as NSString).floatValue
        let totalCommuteTime = ((mileage / mph) * 60) + waitMultiplier
        let gasNeeded = (mileage / gasMileage) * gasMultiplier
        let numberFormatter = NSNumberFormatter()
        
        totalCommute.text = "\(numberFormatter.stringFromNumber(totalCommuteTime)!) min"
        gasToPurchase.text = "\(numberFormatter.stringFromNumber(gasNeeded)!) gal"
        
        if mileage >= 50.0 && transitTypeControl.selectedSegmentIndex == 0{
            let alert=UIAlertController(title: "Warning", message: "You are driving more than 50 miles. Consider moving.", preferredStyle: UIAlertControllerStyle.Alert)

            let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in
            })
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
        }
        }

    func textFieldDidEndEditing(textField: UITextField) {
        updateCommuteTime()
    }

    @IBAction func updateTransitType(sender: UISegmentedControl) {
        updateTransit()
        updateCommuteTime()
    }
    
    

    
    @IBAction func calculateCommute(sender: UIButton) {
        updateCommuteTime()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mileageField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

