//
//  TipCalculatorModel.swift
//  TipCalc
//
//  Created by Student on 1/28/20.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

class TipCalculatorModel
{
    var total: Double
    var taxPct: Double
    var subtotal: Double
    {
        // Computed property
        get
        {
            total / (taxPct + 1)
        }
        /*
         Setter if desired
         set(newSubtotal)
         {
             Do your setting / validation, etc here
         }
        */
    }
    
    init(total: Double, taxPct: Double)
    {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWith(tipPct: Double) -> Double
    {
        // Or as of Swift 5, can leave off return for a single expression
        return subtotal * tipPct
    }
    
    func returnPossibleTips() -> [Int:Double] // or Dictionary<Int,Double>
    {
        let possibleTips = [0.15, 0.18, 0.20]
        
        var retVal = Dictionary<Int, Double>() // or [Int:Double]()
        
        for possibleTip in possibleTips
        {
            let intPct = Int(possibleTip * 100)
            retVal[intPct] = calcTipWith(tipPct: possibleTip)
        }
        
        return retVal
    }
}
