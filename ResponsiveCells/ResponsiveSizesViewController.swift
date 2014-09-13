//
//  ResponsiveSizesViewController.swift
//  ResponsiveCells
//
//  Created by Nacho on 13/9/14.
//  Copyright (c) 2014 Ignacio Nieto Carvajal. All rights reserved.
//

import UIKit

class ResponsiveSizesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func whatElseButton(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

}
