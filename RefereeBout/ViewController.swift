//
//  ViewController.swift
//  RefereeBout
//
//  Created by John Mai on 2/22/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    //default settings to tinker with as bout progresses
    var scoreRight = 0
    var scoreLeft = 0
    var maxTouch = 5
    
    var boutIsOver = false
    var priority: Bool?
    var whoHasPriority: String?
    var period = 1
    
    //3 minutes = 180sec
    var timer: Timer?
    var time = 180.0
    //var timeCount = 3.0
     //number of cards for left
    var yellowCardLeft = 0
    var redCardLeft = 0
    var blackCardLeft = 0
    
    //number of cards for right
    var yellowCardRight = 0
    var redCardRight = 0
    var blackCardRight = 0
    
    //break
    var breakTimer: Timer?
    var breakTime = 60.0
    var nonComTime = 0.0
   
    var touchScored = false
    var nonComTimePrev: Int?
    
    
    @IBOutlet weak var leftScoreView: UILabel!
    @IBOutlet weak var rightScoreView: UILabel!
    @IBOutlet weak var tagView: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func onMoreTapped() {
        print("Toggle")
        NotificationCenter.default.post(name: NSNotification.Name("Toggle Side Menu"), object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leftScoreView.text = String(0)
        rightScoreView.text = String(0)
        timeLabel.text = String(timerFormat(t: time))
        start.setTitle("Start bout", for: .normal)
        //allows the left score view controller to be tapped
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapFunction))
        leftScoreView.isUserInteractionEnabled = true
        leftScoreView.addGestureRecognizer(tap1)
        //allows the right score view controller to be tapped
        let tap2 = UITapGestureRecognizer(target:self, action: #selector(ViewController.tapFuncRight))
        rightScoreView.isUserInteractionEnabled = true
        rightScoreView.addGestureRecognizer(tap2)
        
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        //how you save the data
//        let userDefaults = Foundation.UserDefaults.standard
//        let value = userDefaults.string(forKey: "Key")
//        time = Double(value!)!
//        timeLabel.text = timerFormat(t: time)
//
//
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        if (time >= 0 ) {
            if (timer == nil) {
                start.setTitle("Pause time", for: .normal)
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
            } else {
                start.setTitle("Resume", for: .normal)
                timer?.invalidate()
                timer = nil
                //in case the view disappears it will reload
                //giveYellowLeft()
            }
        } else {
            //start.setTitle("Resume", for: .normal)
            timer?.invalidate()
            timer = nil
            if (period <= 3) {
                period += 1
            }
        }
        
    }
    
    @IBOutlet weak var start: UIButton!
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        scoreLeft += 1
        leftScoreView.text = String(scoreLeft)
    }
    
    @objc func tapFuncRight(sender:UITapGestureRecognizer) {
        scoreRight += 1
        rightScoreView.text = String(scoreRight)
    }
    
    private func awardTouchLeft() {
        scoreLeft += 1
        leftScoreView.text = String(scoreLeft)
    }
    private func awardTouchRight() {
        scoreRight += 1
        rightScoreView.text = String(scoreRight)
    }
    func determinePriority() {
        
        let randomNum = Int.random(in: 0 ... 1)
        if (randomNum == 0) {
            whoHasPriority = "Left"
            tagView.text = "<--"
        } else if (randomNum == 1) {
            whoHasPriority = "Right"
            tagView.text = "-->"
        }
        
        //1 is equal to left, 0 is equal to right
        
        let priorityAlert = UIAlertController(title: "Priority on " + whoHasPriority!, message: "Fencer " + whoHasPriority! + "has priority", preferredStyle: UIAlertControllerStyle.alert)
        priorityAlert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(priorityAlert, animated: true, completion: nil)
        
        
    }
//    func countTime() {
//        if (timer == nil) {
//            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
//        }
//    }
    
    @objc func updateTime() {
        if (time > 0) {
            //time -= 0.1
            //for testing
            time -= 1
            let timeString = timerFormat(t: time)
            timeLabel.text = String(timeString)
        }
        if (time <= 0 && scoreLeft == scoreRight) {
            determinePriority()
        } else if (time <= 0) {
            let alert = UIAlertController(title: "endBout", message: String(scoreLeft) + " - " + String(scoreRight), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func doubleTouch() {
            scoreLeft += 1
            scoreRight += 1
            leftScoreView.text = String(scoreLeft)
            rightScoreView.text = String(scoreRight)
    }
    
    @IBAction func yellowLeftButton(_ sender: Any) {
        let savedTime = time
        let userDefaults = Foundation.UserDefaults.standard
        userDefaults.set(savedTime, forKey: "Key")
        giveYellowLeft()
    }
    func giveYellowLeft() {
        if (yellowCardLeft > 0) {
            giveRedLeft()
        } else {
            performSegue(withIdentifier: "toYellow", sender: self)
            yellowCardLeft += 1
            leftYellowButton.setTitle(String(yellowCardLeft), for: .normal)
        }
    }
    func giveRedLeft() {
        redCardLeft += 1
        awardTouchRight()
        performSegue(withIdentifier: "toRed", sender: self)
        leftRedButton.setTitle(String(redCardLeft), for: .normal)
    }
    func giveYellowRight() {
        if (yellowCardRight > 0) {
            giveRedRight()
        } else {
            performSegue(withIdentifier: "toYellow", sender: self)
            yellowCardRight += 1
            rightYellowButton.setTitle(String(yellowCardRight), for: .normal)
        }
    }
    func giveRedRight() {
        redCardRight += 1
        awardTouchLeft()
        performSegue(withIdentifier: "toRed", sender: self)
        rightRedButton.setTitle(String(redCardRight), for: .normal)
    }
    @IBAction func redLeftButton(_ sender: Any) {
        giveRedLeft()
    }
    
    @IBAction func periodButton(_ sender: Any) {
        period += 1
    }
    
    @IBAction func yellowRightButton(_ sender: Any) {
//        print(yellowCardRight)
        giveYellowRight()
        
    }
    //penalty on right
    @IBOutlet weak var rightYellowButton: UIButton!
    @IBOutlet weak var rightRedButton: UIButton!
    
    //penalty on left
    @IBOutlet weak var leftYellowButton: UIButton!
    @IBOutlet weak var leftRedButton: UIButton!
    
    @IBAction func redRightButton(_ sender: Any) {
        giveRedRight()
    }
    
    //function resets everything to 0.
    func reset() {
        period = 1
        yellowCardRight = 0
        redCardRight = 0
        yellowCardLeft = 0
        redCardLeft = 0
        scoreLeft = 0
        scoreRight = 0
        time = 180.0
    }
    
    func timerFormat(t: Double) -> String {
        let minutes = Int(t / 60)
        let seconds = Int(Int(t) % 60)
        return String(format: "%01i:%02i", minutes,seconds)
    }
    
    @IBAction func doubleButton(_ sender: Any) {
        doubleTouch()
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        print("Toggle sideview")
    }
    
    func vibrate() {
        AudioServicesPlaySystemSound(SystemSoundID(1007))
    }
    
    func nonCombatTivityTime() {
        //when 1 min and no score.
        
    }
}


