//
//  ViewController.swift
//  Leonardo
//
//  Created by Daniel Rankin on 9/1/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var iconFrame: UIImageView!
    @IBOutlet weak var textDisplay: UILabel!

    @IBAction func chooseIcon(sender: UIButton) {
        if sender.tag==1{
            iconFrame.image=UIImage(named: "pig.png")
            textDisplay.text="OINK!"
        }
        else if sender.tag==2{
            iconFrame.image=UIImage(named: "cow.png")
            textDisplay.text="MOO!"
        }
        else if sender.tag==3{
            iconFrame.image=UIImage(named: "chicken.png")
            textDisplay.text="CLUCK!"
        }
        else if sender.tag==4{
            iconFrame.image=UIImage(named: "sheep.png")
            textDisplay.text="BAAA!"
        }
        else if sender.tag==5{
            iconFrame.image=UIImage(named: "horse.png")
            textDisplay.text="NEEIGH!"
        }
        else if sender.tag==6{
            iconFrame.image=UIImage(named: "sloth.png")
            textDisplay.text="......"
        }

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

