//
//  ViewController.swift
//  Project 2
//
//  Created by Daniel Rankin on 10/24/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    /* This shit doesn't work right now
    @IBAction func moveImage2(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: view)
        
    }
    
    @IBAction func moveImage1(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: view)
    }
    end of broken shit*/
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    let analyzer: AKAudioAnalyzer
    let microphone = MicrophoneProcessor()
    let sequence = AKSequence()
    
    var angle: CGFloat=0.0
    var angle1: CGFloat=0.0
    var angle2: CGFloat=0.0
    
    var scaleMultiplier: CGFloat=1.0
    
    var updateAnalysis: AKEvent { //create event to be sequenced
        return AKEvent { self.updateInfo() }
    }

    required init (coder aDecoder: NSCoder) {
        analyzer = AKAudioAnalyzer(input: microphone.auxilliaryOutput)
        super.init(coder: aDecoder)
    
    }

    func addEventToSequence(){ //create and run sequential stuff
        sequence.addEvent(updateAnalysis)
        sequence.play()
        spinImage()
        growImage()
    }
    

    
    func spinImage(){ //spinning thing
        angle += CGFloat(analyzer.trackedAmplitude.value * 15)
        angle1 += CGFloat(analyzer.trackedFrequency.value * 0.0008)
        angle2 += CGFloat(analyzer.trackedAmplitude.value * 12)
        UIView.beginAnimations("spinner", context: nil)
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.imageView.transform=CGAffineTransformMakeRotation(self.angle)
            self.imageView2.transform=CGAffineTransformMakeRotation(self.angle1)
            self.imageView3.transform=CGAffineTransformMakeRotation(self.angle2)
        })
        UIView.commitAnimations()
        // base spinning amounts
        angle += 0.02
        angle1 += 0.025
        angle2 += 0.01
        
        if angle > CGFloat(2 * M_PI){
            angle = 0
        }
        if angle1 > CGFloat(2 * M_PI){
            angle = 0
        }
        if angle2 > CGFloat(2 * M_PI){
            angle = 0
        }
    }
    
    func growImage(){
        scaleMultiplier *= CGFloat(analyzer.trackedFrequency.value * 0.001) //pull frequency data to modify scale
        UIView.beginAnimations("grower", context: nil)
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.imageView.transform = CGAffineTransformScale(self.imageView.transform, self.scaleMultiplier, self.scaleMultiplier)
            self.scaleMultiplier = 1
            
        })
        
    }
    
    func updateInfo (){ //pulled by sequence to check for new audio data
        let freqValue: Float = max(0.1, analyzer.trackedFrequency.value * 0.001)
        let ampValue: Float = max(0.1, analyzer.trackedAmplitude.value * 15)
        println ("amplitude \(ampValue), frequency \(freqValue)")
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addEventToSequence()
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "addEventToSequence", userInfo: nil, repeats: true) //timer for animation and audio listening
        
        
        AKSettings.shared().audioInputEnabled = true
        AKOrchestra.addInstrument(microphone)
        AKOrchestra.addInstrument(analyzer)
        microphone.start()
        analyzer.start()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/*sources

AudioKitDemo, http://audiokit.io
Images: Daniel Rankin

*/
