//
//  LeftPYellowViewController.swift
//  RefereeBout
//
//  Created by John Mai on 4/5/19.
//  Copyright © 2019 John. All rights reserved.
//

import UIKit

class LeftPYellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255, green: 255, blue: 0, alpha: 1.0)
        //        performAfter(delay: 2) {
        //            print("task to be done")
        //        }
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            
            self.dismiss(animated: true, completion: nil)
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
