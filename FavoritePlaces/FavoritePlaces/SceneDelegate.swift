//
//  SceneDelegate.swift
//  FavoritePlaces
//
//  Created by Ellie on 3/3/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit
import CoreLocation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var tabBarController: UITabBarController?
    var landmarks: [Landmark] = []
    
    func loadData() {
        do {
            // Safer to do this in an if-let rather than force unwrap but we don't care right now
            let plistPath = Bundle.main.path(forResource: "landmarks", ofType: "plist")!
            let data = try Data(contentsOf: URL(fileURLWithPath: plistPath))
            
            let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]
            print(tempDict)
            
            let tempArray = tempDict["landmarks"]! as! Array<[String:Any]>
            
            for dict in tempArray {
                print(dict)
                // Safer way:
                let name = dict["name"] as? String ?? "No Name"
                let state = dict["state"] as? String ?? "No State"
                // Unsafer way:
                let latitutde = dict["latitude"] as! Double
                let longitute = dict["longitude"] as! Double
                let location = CLLocation(latitude: latitutde, longitude: longitute)
                
                let lm = Landmark(name: name, state: state, location: location)
                landmarks.append(lm)
            }
        }
        catch {
            print(error)
        }
        
        print("There are \(landmarks.count) landmarks.")
        print(landmarks)
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        loadData()
        
        tabBarController = window?.rootViewController as? UITabBarController
        
        let mapVC = tabBarController!.viewControllers![0] as! MapVC
        let landmarkList = Landmarks()
        landmarkList.landmarkList = landmarks
        mapVC.landmarkList = landmarkList
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

