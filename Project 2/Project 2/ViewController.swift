//
//  ViewController.swift
//  Project 2
//
//  Created by Daniel Rankin on 10/24/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var imageView: UIImageView!
    
    let analyzer: AKAudioAnalyzer
    let microphone = MicrophoneProcessor()
    let sequence = AKSequence()
    
    var angle: CGFloat=0.0
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
        UIView.beginAnimations("spinner", context: nil)
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.imageView.transform=CGAffineTransformMakeRotation(self.angle)
        })
        UIView.commitAnimations()
        angle += 0.02 // insert reference to amplitude/frequency here for dynamic update
        if angle > CGFloat(2 * M_PI){
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
        let ampValue: Float = max(0.1, analyzer.trackedFrequency.value * 0.0015)
        println (ampValue)
        
        
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

