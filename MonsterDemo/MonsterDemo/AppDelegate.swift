//
//  AppDelegate.swift
//  MonsterDemo
//
//  Created by Student on 1/23/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let m1 = Monster()
        print(m1)
        m1.fearsomeRoar()
        print("The monster's name is \(m1.getName())")
        m1.set(name: "Dog")
        print("The monster's name is \(m1.getName())")
        
        let m2 = Monster(numHeads: 5000, name: "Dwarf", weapons: ["Bad Breath", "Hard Head"], undead: true)
        print("M2: \(m2)")
        print("M2: \(m2.debugDescription)")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

