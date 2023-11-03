//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let eggTimes = ["Soft": 3.0, "Medium":10.0, "Hard": 20.0]
    
    var timer = Timer()
    var totalTime = 0.0
    var secondsPassed  = 0.0
    
    override func viewDidLoad() {
        progressBar.progress = 0.0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0.0
        doneLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target:self,selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var doneLabel: UILabel!
    
    @objc func updateCounter(){
        if secondsPassed < totalTime {
            secondsPassed += 0.01
            progressBar.progress = Float(secondsPassed)/(Float(totalTime))
            print(Float(secondsPassed) / Float(totalTime))
        }else{
            timer.invalidate()
            doneLabel.text = "DONE"
            viewDidLoad()
        }
    }
}
