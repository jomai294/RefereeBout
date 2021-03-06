//
//  BlackViewController.swift
//  RefereeBout
//
//  Created by John Mai on 4/8/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class BlackViewController: UIViewController {

    @IBOutlet weak var BlackCardLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        BlackCardLabel.text = "Black Card"
        BlackCardLabel.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.view.isHidden = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
