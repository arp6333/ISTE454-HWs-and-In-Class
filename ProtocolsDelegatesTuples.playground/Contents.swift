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
    
    func writeTutorial() {
        print("I'm on it!")
    }
}

class Animal{}
class Dog: Animal, Speaker {
    func speak() {
        print("Woof!")
    }
}

var speaker: Speaker = Bryan()
if speaker is Bryan {
    print("Hi, I'm a Bryan")
}
speaker.speak()
//speaker.writeTutorial() // We cannot do this bc it was created as type Speaker and not type Bryan
// So we must do this - cast to Bryan:
(speaker as! Bryan).writeTutorial()

var testing: Bryan = (speaker as! Bryan)
testing.speak()
testing.tellJoke()
testing.writeTutorial()

speaker = Deb()
speaker.speak()
speaker.tellJoke?()

speaker = Dog()
speaker.tellJoke?() // Returns nil, Dog doesn't have optional method tellJoke()




// Delegates

protocol MtgSimulatorDelegate {
    func mtgSimulatorDidStart(sim: MtgSimulator, a: Speaker, b: Speaker)
    func mtgSimulatorDidEnd(sim: MtgSimulator, a: Speaker, b: Speaker)
}

class LoggingMtgSimulator : MtgSimulatorDelegate {
    func mtgSimulatorDidStart(sim: MtgSimulator, a: Speaker, b: Speaker) {
        print("The meeting started!")
    }
    
    func mtgSimulatorDidEnd(sim: MtgSimulator, a: Speaker, b: Speaker) {
        print("The meeting ended!")
    }
}

class MtgSimulator {
    let a: Speaker
    let b: Speaker
    var delegate: MtgSimulatorDelegate?
    
    init(a: Speaker, b: Speaker) {
        self.a = a;
        self.b = b
    }
    
    func simulate() {
        print("Off to meeting...")
        delegate?.mtgSimulatorDidStart(sim: self, a: a, b: b)
        a.speak()
        b.speak()
        print("Leaving meeting...")
        delegate?.mtgSimulatorDidEnd(sim: self, a: a, b: b)
        a.tellJoke?()
        b.tellJoke?()
    }
}

let sim = MtgSimulator(a: Deb(), b: Bryan())
sim.delegate = LoggingMtgSimulator()
sim.simulate()




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
