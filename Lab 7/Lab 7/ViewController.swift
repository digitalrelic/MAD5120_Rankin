//
//  ViewController.swift
//  Lab 7
//
//  Created by Daniel Rankin on 10/23/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    let filename = "audio.caf"
    
    @IBAction func playAudio(sender: UIButton) {
        if audioRecorder?.recording == false{
            stopButton.enabled = true
            recordButton.enabled = false
            var error: NSError?
            
            audioPlayer = AVAudioPlayer(contentsOfURL: audioRecorder?.url, error: &error)
            
            if let err = error {
                println ("AVAudioPlayer error: \(err.localizedDescription)")
            }else{
                audioPlayer?.delegate=self
                audioPlayer?.play()
    }
        }
    }
    
    @IBAction func recordAudio(sender: UIButton) {
        if audioRecorder?.recording == false{
            playButton.enabled = false
            stopButton.enabled = true
            audioRecorder?.record()
    }
    }
    
    @IBAction func stopAudio(sender: AnyObject) {
        stopButton.enabled = false
        playButton.enabled = true
        recordButton.enabled = true
        
        if audioRecorder?.recording == true{
            audioRecorder?.stop()
        }else{
            audioPlayer?.stop()
        }
    }
    
    
    override func viewDidLoad() {
        playButton.enabled = false
        stopButton.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docDir = dirPath[0] as! String
        let audioFilePath = docDir.stringByAppendingPathComponent(filename)
        let audioFileURL = NSURL(fileURLWithPath: audioFilePath)
        
        let recordSettings = [AVEncoderAudioQualityKey: AVAudioQuality.Min.rawValue, AVEncoderBitRateKey: 16, AVNumberOfChannelsKey: 2, AVSampleRateKey: 44100.0]
        var error : NSError?
        
        audioRecorder = AVAudioRecorder(URL: audioFileURL, settings: recordSettings as [NSObject : AnyObject], error: &error)
        
        if let err = error {
            println("AVAudioRecorder error: \(err.localizedDescription)")
        }else{
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
            
        }

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

