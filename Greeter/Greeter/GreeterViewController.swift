//
//  GreeterViewController.swift
//  Greeter
//
//  Created by Ellie on 2/11/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit

class GreeterViewController: UIViewController {
    
    @IBOutlet weak var inText: UITextField!
    @IBOutlet weak var outText: UILabel!
    
    @IBAction func sayHello() {
        // Set greeting
        outText.text = "Hi \(inText.text!)! I'm glad you stopped by today."
        
        // Clear text field
        inText.resignFirstResponder()
        inText.text = ""
    }

    @IBAction func viewTapped(_ sender: Any) {
        inText.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
