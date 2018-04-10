//
//  YellowViewController.swift
//  RefereeBout
//
//  Created by John Mai on 4/7/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 255, green: 255, blue: 0, alpha: 1.0)
//        performAfter(delay: 2) {
//            print("task to be done")
//        }
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.view.isHidden = true
            self.performSegue(withIdentifier: "toMainYellow", sender: self)
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func performAfter(delay: TimeInterval, completion: @escaping () -> Void) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            completion()
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
