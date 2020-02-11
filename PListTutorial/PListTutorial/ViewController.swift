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
        if let documentsPathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                   var plistPath = documentsPathURL.appendingPathComponent("data.plist")
            
            // Get info from GUI and save it
            personName = nameEntered.text!
            phoneNumbers = [homePhone.text!, workPhone.text!, cellPhone.text!]
            
            let plistDict: Dictionary<String, Any> = [
                "Name": personName,
                "Phones": phoneNumbers
            ]
            
            do {
                let plistData = try PropertyListSerialization.data(fromPropertyList: plistDict, format: .xml, options: 0)
                
                try plistData.write(to: plistPath)
            }
            catch {
                print(error)
            }
        }
        
        // Dismiss keyboard whenever you have multiple fields
        view.endEditing(true)
    }
    
    @IBAction func deleteData(sender: UIButton) {
        let fileMgr = FileManager.default
        
        let dir = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first
        
        // Show contents of the directory
        print("Before deleting: \(try? fileMgr.contentsOfDirectory(atPath: dir!.path))")
        
        let fileURL = dir!.appendingPathComponent("data.plist")
        
        do {
            try fileMgr.removeItem(at: fileURL)
        }
        catch {
            print(error)
        }
        
        print("After deleting: \(try? fileMgr.contentsOfDirectory(atPath: dir!.path))")
    }
    
    @IBAction func textFieldReturn(sender: UITextField) {
        // Dismiss keyboard when user presses return / done
        sender.resignFirstResponder()
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
