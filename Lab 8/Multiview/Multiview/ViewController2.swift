//
//  ViewController2.swift
//  Multiview
//
//  Created by Daniel Rankin on 11/22/15.
//  Copyright © 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userBrand: UITextField!
    @IBOutlet weak var userType: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneFavs"{
            let scene1ViewController:ViewController = segue.destinationViewController as! ViewController
           
            if userBrand.text!.isEmpty == false{
                scene1ViewController.user.favBrand=userBrand.text
            }
            if userType.text!.isEmpty == false{
                scene1ViewController.user.favType=userType.text
            }
        }
    }
    
    override func viewDidLoad() {
        userBrand.delegate=self
        userType.delegate=self
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
