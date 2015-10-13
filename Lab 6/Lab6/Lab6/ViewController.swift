//
//  ViewController.swift
//  Lab6
//
//  Created by Daniel Rankin on 10/13/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    var audioPlayer: AVAudioPlayer?
    var state:Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1
    }
    
    @IBAction func handleLongpress(sender: UILongPressGestureRecognizer) {
        if state == 1 {
            
        
        let audioFilePath = NSBundle.mainBundle().pathForResource("sound2", ofType: "caf")
        let fileURL = NSURL(fileURLWithPath: audioFilePath!)
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        if audioPlayer != nil{
            audioPlayer!.play()
            state = 0
            }
        }
        else if state == 0 {
                
                
                let audioFilePath = NSBundle.mainBundle().pathForResource("sound1", ofType: "caf")
                let fileURL = NSURL(fileURLWithPath: audioFilePath!)
                audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
                if audioPlayer != nil{
                    audioPlayer!.play()
                    state = 1
    }
    }
    }
    
    
        
    @IBAction func handleRotate(sender: UIRotationGestureRecognizer) {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation=0
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y:sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: view)
        if sender.state == UIGestureRecognizerState.Ended {
            
            let velocity = sender.velocityInView(self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            
            let slideFactor = 0.1 * slideMultiplier
            
            var finalPoint = CGPoint(x:sender.view!.center.x + (velocity.x * slideFactor), y:sender.view!.center.y + (velocity.y * slideFactor))
            
            finalPoint.x = min(max(finalPoint.x, 20), self.view.bounds.size.width-20)
            finalPoint.y = min(max(finalPoint.y, 20), self.view.bounds.size.height-20)
            
                UIView.animateWithDuration(Double(slideFactor * 2), delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {sender.view!.center = finalPoint }, completion: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

