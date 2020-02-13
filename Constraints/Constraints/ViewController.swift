//
//  ViewController.swift
//  Constraints
//
//  Created by Ellie on 2/13/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonTapped(sender: UIButton) {
        if sender.title(for: UIControl.State()) == "X" {
            sender.setTitle("A very long title for this button", for: UIControl.State())
        }
        else {
            sender.setTitle("X", for: UIControl.State())
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

