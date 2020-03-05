import UIKit

// This class is from mycourses
class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    //computed property
    var subtotal: Double {
        get {
             total/(taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWith(tipPct: Double) ->Double {
        return subtotal * tipPct
    }
    
    func returnPossibleTips()->Dictionary<Int,(tipAmt:Double,total:Double)>{
        let possibleTips=[0.15,0.18,0.20]

        var retval = [Int:(Double,Double)]()
        for possibleTip in possibleTips {
            let intPct = Int(possibleTip * 100)
            let tip = calcTipWith(tipPct: possibleTip)
            let newTotal = subtotal + tip
            retval[intPct]=(tip,newTotal)
        }
        return retval
    }
}

// DataSources must inherit from NSObject either directly or through another class
class TestDataSource: NSObject, UITableViewDataSource {
    let tipCalc = TipCalculatorModel(total:33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int, (tipAmt: Double, total: Double)>()
    var sortedKeys: [Int] = []
    
    // Overriding the NSObject initializer
    override init() {
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = Array(possibleTips.keys)
        sortedKeys.sort()
        super.init()
    }
    
    // Required for UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    
    // Required for UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel?.text = "\(tipPct)%: "
        cell.detailTextLabel?.text = String(format: "Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        return cell
    }
}

let testDataSource = TestDataSource()
let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), style: .plain)
tableView.dataSource = testDataSource
tableView.reloadData()
