//
//  ViewController.swift
//  DrawMailer
//
//  Created by Ellie on 4/24/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customView : CustomView!
    @IBOutlet weak var bgControl: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.text = ""
    }
    
    @IBAction func sharePicture() {
        let image = customView.createImageFromContext()
        let message = "Here's a great drawing!"
        let postItems = [message,image] as [Any]
        let activityVC = UIActivityViewController(activityItems: postItems, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func changeBackground(_ sender: Any) {
        if bgControl.selectedSegmentIndex == 1 {
            print("Background to white")
            textView.backgroundColor = .white
        } else {
            print("Background to black")
            textView.backgroundColor = .black
        }
    }
    
    @IBAction func cls() {
        print("Clear the screen")
        customView?.cls()
    }
}
