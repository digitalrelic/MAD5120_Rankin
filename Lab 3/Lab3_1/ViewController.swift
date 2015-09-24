//
//  ViewController.swift
//  Lab3_1
//
//  Created by Daniel Rankin on 9/24/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numPkgs: UITextField!
    @IBOutlet weak var numStrips: UITextField!
    @IBOutlet weak var numEaters: UITextField!
    @IBOutlet weak var totalBacon: UILabel!
    @IBOutlet weak var baconPerPerson: UILabel!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func howMuchBacon (){
        let pkgs = numPkgs.text.toInt()
        let strips = numStrips.text.toInt()
        let eaters = numEaters.text.toInt()
        let total : Int = pkgs!*strips!
        var perPerson : Int = 0
        perPerson = total/eaters!
        
        var numberFormatter = NSNumberFormatter()
        totalBacon.text=numberFormatter.stringFromNumber(total)
        baconPerPerson.text=numberFormatter.stringFromNumber(perPerson)
        
                if eaters == 1 {
                    let alert=UIAlertController(title: "Hey!", message: "YOU GET ALL THE BACON!", preferredStyle: UIAlertControllerStyle.Alert)
                let cancelAction=UIAlertAction(title: "OK!", style:UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction)
        
                presentViewController(alert, animated: true, completion: nil)
            }

    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        howMuchBacon()
    }
    


    
    
    override func viewDidLoad() {
        numPkgs.delegate=self
        numStrips.delegate=self
        numEaters.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

