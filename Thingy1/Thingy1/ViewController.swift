//
//  ViewController.swift
//  Thingy1
//
//  Created by Daniel Rankin on 8/27/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageText: UILabel!
    @IBAction func button2Pressed(sender: UIButton) {
        messageText.text=" "
    }
    @IBAction func buttonPressed(sender: UIButton) {
        messageText.text="GO GO GO"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

