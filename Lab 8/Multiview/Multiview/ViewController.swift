//
//  ViewController.swift
//  Multiview
//
//  Created by Daniel Rankin on 11/22/15.
//  Copyright © 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    var user=Favorite()
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        brandLabel.text=user.favBrand
        typeLabel.text=user.favType
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

