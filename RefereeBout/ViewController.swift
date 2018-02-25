//
//  ViewController.swift
//  RefereeBout
//
//  Created by John Mai on 2/22/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scoreRight = 0
    var scoreLeft = 0
    var maxTouch = 5
    var boutIsOver = false
    var timeStop = true
    
    //3 minutes = 180sec
    var time = 180
    
     //number of cards for left
    var yellowCardLeft = 0
    var redCardLeft = 0
    var blackCardLeft = 0
    
    //number of cards for right
    var yellowCardRight = 0
    var redCardRight = 0
    var blackCardRight = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: Selector("countTime"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButton(_ sender: Any) {
        if (timeStop) {
            return
        }
        countTime()
    }
    
    
    func countTime() {
        if (!timeStop && time > 0) {
            let minutes = String(time/60)
            let seconds = String(time % 60)
            timeLabel.text = minutes + ":" + seconds
            time = time - 1
        }
    }

}

