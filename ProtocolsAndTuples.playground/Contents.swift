import UIKit
import Foundation

// Protocols: similar to interfaces

@objc protocol Speaker {
    func speak()
    // Optional function, must add @objc in front of protocol as well
    @objc optional func tellJoke()
}

class Deb: Speaker {
    func speak() {
        print("Hello, I am Deb!")
    }
    
    func tellJoke() {
        print("Q: What did Sushi A say to Sushi B?") // Wasabi!
    }
}

class Bryan: Speaker {
    func speak() {
        print("Yo, I'm Bryan!")
    }
    
    func tellJoke() {
        print("Q: What is the object-oriented way to become wealthy?") // Inheritance
    }
}

class Animal{}
class Dog: Animal, Speaker {
    func speak() {
        print("Woof!")
    }
}





// Tuple Examples

let tipAndTotal = (4.00, 25.19)
tipAndTotal.0
tipAndTotal.1

let (theTip, theTotal) = tipAndTotal
theTip
theTotal

// Named tuples
let tipAndTotalNamed = (tipAmt: 4.00, total: 25.19)
// Or name on the left side:
// let tipAndTotalNamed: (tipAmt: Double, total: Double) = (4.00, 25.19)
tipAndTotalNamed.tipAmt
tipAndTotalNamed.total


// Function with tuple return
let total = 21.19
let taxPct = 0.06
let subtotal = total / (taxPct + 1)

func calcTipWith(tipPct: Double) -> (tipAmt: Double, total: Double) {
    let tipAmt = subtotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal)
}

calcTipWith(tipPct: 0.2)
