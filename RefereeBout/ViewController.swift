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
    
   
    
    var timer = Timer()
    
     //number of cards for left
    var yellowCardLeft = 0
    var redCardLeft = 0
    var blackCardLeft = 0
    
    //number of cards for right
    var yellowCardRight = 0
    var redCardRight = 0
    var blackCardRight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButton(_ sender: Any) {
        if (timeStop) {
            return
        }
        
    }
    func startBout() {
        
    }

}

