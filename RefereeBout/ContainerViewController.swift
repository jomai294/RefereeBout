//
//  ContainerViewController.swift
//  RefereeBout
//
//  Created by John Mai on 4/26/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("Toggle Side Menu"), object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func toggleSideMenu() {
        if (sideMenuOpen) {
            //if it is open then it will hide it
            sideMenuOpen = false
            sideMenuConstraint.constant = -240
        } else {
            //otherwise it will bring it onto the screen at 0
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }
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
