//
//  ViewController.swift
//  Haha
//
//  Created by Student on 2/4/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import AVFoundation

class HahaViewController: UIViewController {

    let HA_HA_FILE = "haha"
    let HA_HA_FORMAT = "mp3"
    var player: AVAudioPlayer?
    var counter: Int
    
    @IBOutlet weak var label: UILabel!
    
    required init?(coder: NSCoder) {
        counter = 0
        
        if let soundFilePath = Bundle.main.path(forResource: HA_HA_FILE, ofType: HA_HA_FORMAT) {
            let fileUrl = URL(fileURLWithPath: soundFilePath)
            
            do {
                player = try AVAudioPlayer(contentsOf: fileUrl)
            }
            catch {
                player = nil
                print(error)
            }
        }
        else {
            player = nil
        }
        
        // Eliminate delay
        player?.prepareToPlay()
        
        super.init(coder: coder)
    }
    
    @IBAction func stopSound(sender: UIButton) {
        if player != nil {
            player?.stop()
        }
    }
    
    @IBAction func playSound(sender: UIButton) {
        if player != nil {
            player?.play()
            counter += 1
            label.text = "Ha Ha #\(counter)"
        }
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        // Animate the button
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: sender.center.x - 5, y: sender.center.y - 5))
        shake.toValue = NSValue(cgPoint: CGPoint(x: sender.center.x + 5, y: sender.center.y + 5))
        sender.layer.add(shake, forKey: "position")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.shadowColor = UIColor.gray
        label.shadowOffset = CGSize(width: 3, height: -3)
        label.textColor = UIColor.white
        label.font = UIFont(name: "MarkerFeld-Wide", size: 30)
        label.text = ""
    }
}
