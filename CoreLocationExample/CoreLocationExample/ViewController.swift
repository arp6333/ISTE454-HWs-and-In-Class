//
//  ViewController.swift
//  CoreLocationExample
//
//  Created by Ellie on 2/25/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var location: CLLocation?
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var hAccuracy: UILabel!
    @IBOutlet weak var vAccuracy: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var course: UILabel!
    
    var geocoder = CLGeocoder()
    //var placemark: CLPlacemark?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
        }
        
        // Setup the location manager
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    // MARK:- CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
        print("\(location)")
        
        latitude.text = String(format: "%.4f", location!.coordinate.latitude)
        longitude.text = String(format: "%.4f", location!.coordinate.longitude)
        altitude.text = String(format: "%.4f", location!.altitude)
        hAccuracy.text = String(format: "%.4f", location!.horizontalAccuracy)
        vAccuracy.text = String(format: "%.4f", location!.verticalAccuracy)
        timeStamp.text = "\(location!.timestamp)"
        speed.text = String(format: "%.4f", location!.speed)
        course.text = String(format: "%.4f", location!.course)
        
        locationManager.stopUpdatingLocation()
        
        // Reverse geocoding
        geocoder.reverseGeocodeLocation(location!, completionHandler: {
            (placemarks, error) -> Void in
            print(self.location!)
            
            if error != nil {
                print("Reverse geocoding failed: \(error!.localizedDescription)")
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks!.last
                let address = "\(pm!.subThoroughfare) \(pm!.thoroughfare)\n\(pm!.postalCode)\n\(pm!.locality)\n\(pm!.administrativeArea)\n\(pm!.country)"
                print(address)
            }
            else {
                print("Problem with data received from geocoder.")
            }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let errorAlert = UIAlertController(title: "Error", message: "Failed to get your location", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        errorAlert.addAction(okAction)
        
        present(errorAlert, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            case .authorizedAlways:
                locationManager.startUpdatingLocation()
            case .notDetermined:
                locationManager.requestAlwaysAuthorization()
            case .authorizedWhenInUse, .restricted, .denied:
                let alertController = UIAlertController(title: "Background Location Access Disabled", message: "In order for the NSA to track you, open this apps settings and set location access to 'Always'", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                let openAction = UIAlertAction(title: "Open Settings", style: .default) {
                    (action) in
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                alertController.addAction(openAction)
                present(alertController, animated: true)
            @unknown default:
                fatalError() // Covers future status values if any
        }
    }
}
