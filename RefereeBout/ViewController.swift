//
//  ViewController.swift
//  RefereeBout
//
//  Created by John Mai on 2/22/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //default settings to tinker with as bout progresses
    var scoreRight = 0
    var scoreLeft = 0
    var maxTouch = 5
    
    var boutIsOver = false
    var priority: Bool?
    var whoHasPriority: Int?
    var timeStop = true
    var period = 1
    
    //3 minutes = 180sec
    var time = 180.0
    var timeCount = 3.0
     //number of cards for left
    var yellowCardLeft = 0
    var redCardLeft = 0
    var blackCardLeft = 0
    
    //number of cards for right
    var yellowCardRight = 0
    var redCardRight = 0
    var blackCardRight = 0
    
    
    @IBOutlet weak var leftScoreView: UILabel!
    @IBOutlet weak var rightScoreView: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leftScoreView.text = String(0)
        rightScoreView.text = String(0)
        timeLabel.text = String(timerFormat(t: time))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButton(_ sender: Any) {
        countTime()
    }
    
    func determinePriority() {
        let randomNum = (Int)(arc4random() * 2)
        //1 is equal to left, 0 is equal to right
        if (randomNum == 1) {
            whoHasPriority = 1
        } else {
            whoHasPriority = 0
        }
    }
    func countTime() {
        if (timeStop) {
            let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTime() {
        time -= 0.1
        let timeString = timerFormat(t: time)
        timeLabel.text = String(timeString)
    }
    
    func doubleTouch() {
        if ((maxTouch == 5 && scoreLeft != 4 && scoreRight != 4 ) || (maxTouch == 15 && scoreLeft != 14 && scoreRight != 14)) {
            scoreLeft += 1
            scoreRight += 1
        }
    }
    
    @IBAction func yellowLeftButton(_ sender: Any) {
        yellowCardLeft += 1
        print(yellowCardLeft)
    }
    
    @IBAction func redLeftButton(_ sender: Any) {
        redCardLeft += 1
        print(redCardLeft)
    }
    
    @IBAction func periodButton(_ sender: Any) {
        period += 1
    }
    
    @IBAction func yellowRightButton(_ sender: Any) {
        yellowCardRight += 1
        print(yellowCardRight)
    }
    
    @IBAction func redRightButton(_ sender: Any) {
        redCardRight += 1
        print(redCardRight)
    }
    
    func reset() {
        period = 1
        yellowCardRight = 0
        redCardRight = 0
        yellowCardLeft = 0
        redCardLeft = 0
    }
    
    func pauseTimer() {
        
    }
    
    private func timerFormat(t: Double) -> String {
        let minutes = Int(t / 60)
        let seconds = Int(Int(t) % 60)
        return String(minutes) + ":" + String(seconds)
    }
    
}

