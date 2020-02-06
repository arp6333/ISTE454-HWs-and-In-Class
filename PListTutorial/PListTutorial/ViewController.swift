//
//  ViewController.swift
//  PListTutorial
//
//  Created by Ellie on 2/6/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameEntered: UITextField!
    @IBOutlet weak var homePhone: UITextField!
    @IBOutlet weak var workPhone: UITextField!
    @IBOutlet weak var cellPhone: UITextField!
    
    var personName = ""
    var phoneNumbers: [String] = []
    
    @IBAction func saveData(sender: UIButton) {
        
    }
    
    @IBAction func textFieldReturn(sender: UITextField) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let documentsPathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            var plistPath = documentsPathURL.appendingPathComponent("data.plist").path
            if !FileManager.default.fileExists(atPath: plistPath) {
                plistPath = Bundle.main.path(forResource: "data", ofType: "plist")!
            }
            print(plistPath)
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: plistPath))
                
                let temp = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String: Any]
                print ("\(temp)")
                
                personName = temp["Name"] as? String ?? "TBD"
                phoneNumbers = temp["Phones"] as? [String] ?? ["TBD", "TBD", "TBD"]
                
                nameEntered.text = personName
                homePhone.text = phoneNumbers[0]
                workPhone.text = phoneNumbers[1]
                cellPhone.text = phoneNumbers[2]
            }
            catch {
                print (error)
            }
        }
    }

}
