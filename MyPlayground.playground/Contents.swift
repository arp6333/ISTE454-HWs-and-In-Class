class TipCalculator
{
    let total : Double
    let taxPct : Double
    let subtotal : Double
    
    init(total : Double, taxPct : Double)
    {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    func calcTipWith(tipPct: Double) -> Double
    {
        return subtotal * tipPct // Or as of Swift 5, can leave off return for a single expression
    }
    
    func printPossibleTips()
    {
//        print("15%: \(calcTipWith(tipPct: 0.15))")
//        print("18%: \(calcTipWith(tipPct: 0.18))")
//        print("20%: \(calcTipWith(tipPct: 0.20))")
        // 'cmd /' to comment highlighted lines
        
        //let possibleTips:[Double] = [0.15, 0.18, 0.20]
        //let possibleTips:Array<Double> = [0.15, 0.18, 0.20]
        let possibleTips = [0.15, 0.18, 0.20]
        
        for possibleTip in possibleTips
        {
            print("\(possibleTip * 100)%: \(calcTipWith(tipPct: possibleTip))")
        }
        
//        for i in 0..<possibleTips.count
//        {
//            let possibleTip = possibleTips[i]
//            print("\(possibleTip * 100)%: \(calcTipWith(tipPct: possibleTip))")
//        }
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

let tipCalc = TipCalculator(total: 33, taxPct: 0.06)
tipCalc.printPossibleTips()
tipCalc.returnPossibleTips()


let tutorialTeam = 56
let editorialTeam = 23
var totalTeam = tutorialTeam + editorialTeam

totalTeam += 1

let priceInferred = 19.99
let priceExplicit : Double = 19.99

let onSale : Bool = true

let name = "My favorite toy!"

if onSale
{
    print("\(name) is on sale for \(priceInferred)")
}
else
{
    print("\(name) at regular price \(priceExplicit)")
}
