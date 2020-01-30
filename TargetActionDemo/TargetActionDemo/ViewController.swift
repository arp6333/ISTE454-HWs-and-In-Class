//
//  ViewController.swift
//  TargetActionDemo
//
//  Created by Student on 1/30/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var clockLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func okClicked()
    {
        textName.resignFirstResponder()
        let str = "Hello \(textName.text!)"
        let alert = UIAlertController(title: "Greetings!", message: str, preferredStyle: .alert)
        
        //let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        //let okAction = UIAlertAction(title: "OK", style: .default)
        //{ (action) in
            // do something here
        //}
        let okAction = UIAlertAction(title: "OK", style: .default, handler:
        { (action) in
          // do something here
        })
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
        
        textName.text = ""
    }
    
    @IBAction func clockButtonClicked(_ sender: UIButton)
    {
        
    }
    
    // MARK:- TextFieldDelegate Methods
    // TODO: Need to finish here
    // FIXME: Need to fix this
    //#error("some message")
    //#warning("some message")
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Just dimiss keyboard
        //textField.resignFirstResponder()
        // or to use the greeting
        okClicked()
        
        return true
    }
    
} // ViewController
