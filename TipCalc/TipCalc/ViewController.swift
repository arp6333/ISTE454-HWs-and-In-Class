//
//  ViewController.swift
//  TipCalc
//
//  Created by Student on 1/28/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var taxPctLabel: UILabel!
    @IBOutlet var resultsTextView: UITextView!
    
    @IBAction func calculateTapped(sender: UIButton)
    {
        tipCalc.total = Double(totalTextField.text!)!
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        //for (tipPct, tipValue) in possibleTips
        //{
        //    results += "\(tipPct)%: \(tipValue)\n"
        //}
        
        var keys = Array(possibleTips.keys)
        keys.sort()
        for tipPct in keys
        {
            let tipValue = possibleTips[tipPct]!
            let prettyTipValue = String(format:"%.2f", tipValue)
            results += "\(tipPct)%: \(prettyTipValue)\n"
        }
        
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanged(sender: UISlider)
    {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(send: UIView)
    {
        totalTextField.resignFirstResponder()
    }
    
    func refreshUI()
    {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value)))%:"
        resultsTextView.text = "";
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        refreshUI()
    }
}
