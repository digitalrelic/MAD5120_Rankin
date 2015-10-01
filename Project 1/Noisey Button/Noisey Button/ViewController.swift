//
//  ViewController.swift
//  Noisey Button
//
//  Created by Daniel Rankin on 9/29/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var imageDisplay: UIImageView!

    var audioPlayer = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    var audioPlayer3 = AVAudioPlayer()
    var audioPlayer4 = AVAudioPlayer()
    var audioPlayer5 = AVAudioPlayer()
    var audioPlayer6 = AVAudioPlayer()
    var audioPlayer7 = AVAudioPlayer()
    var audioPlayer8 = AVAudioPlayer()

    var instTypeName = String()
    
    @IBOutlet weak var soundSetting: UISegmentedControl!
    
    func getName (){
        if soundSetting.selectedSegmentIndex == 0{
            instTypeName = "note"
            imageDisplay.image=UIImage(named: "noise-02.png")
        }
        else if soundSetting.selectedSegmentIndex == 1{
            instTypeName = "buzz"
            imageDisplay.image=UIImage(named: "noise-01.png")
        }
        else if soundSetting.selectedSegmentIndex == 2{
            instTypeName = "cat"
            imageDisplay.image=UIImage(named: "noise-03.png")
        }
    }
    
    
    
    
    
    @IBAction func note1(sender: AnyObject) {
        getName()
        let soundURL = NSBundle.mainBundle().URLForResource(instTypeName + "1", withExtension: "caf")
        audioPlayer = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer.play()
    }
    
    @IBAction func note2(sender: AnyObject) {
        getName()
        let soundURL = NSBundle.mainBundle().URLForResource(instTypeName + "2", withExtension: "caf")
        audioPlayer2 = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer2.play()
    }
    @IBAction func note3(sender: AnyObject) {
        getName()
        let soundURL = NSBundle.mainBundle().URLForResource(instTypeName + "3", withExtension: "caf")
        audioPlayer3 = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer3.play()
    }
   
    @IBAction func note4(sender: AnyObject) {
        getName()
        let soundURL = NSBundle.mainBundle().URLForResource(instTypeName + "4", withExtension: "caf")
        audioPlayer4 = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer4.play()
    }
    @IBAction func note5(sender: AnyObject) {
        getName()
        let soundURL = NSBundle.mainBundle().URLForResource(instTypeName + "5", withExtension: "caf")
        audioPlayer5 = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer5.play()
    }
    @IBAction func note6(sender: AnyObject) {
        getName()
        let soundURL = NSBundle.mainBundle().URLForResource(instTypeName + "6", withExtension: "caf")
        audioPlayer6 = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer6.play()
    }
    @IBAction func note7(sender: AnyObject) {
        getName()
        let soundURL = NSBundle.mainBundle().URLForResource(instTypeName + "7", withExtension: "caf")
        audioPlayer7 = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer7.play()
    }
    @IBAction func note8(sender: AnyObject) {
        getName()
        let soundURL = NSBundle.mainBundle().URLForResource(instTypeName + "8", withExtension: "caf")
        audioPlayer8 = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        audioPlayer8.play()
    }

    
    @IBOutlet weak var keyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

