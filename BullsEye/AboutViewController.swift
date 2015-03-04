//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Ajay Gupta on 3/3/15.
//  Copyright (c) 2015 Lennox International. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close()
    {
        dismissViewControllerAnimated(true, completion: nil);
    }

}
