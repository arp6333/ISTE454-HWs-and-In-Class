//
//  ViewController.swift
//  MyLocationMap
//
//  Created by Ellie on 2/27/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    var locationManager: CLLocationManager
    
    @IBOutlet weak var mapView: MKMapView!
    
    required init?(coder: NSCoder) {
        locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
        }
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let mkCoordinateRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(mkCoordinateRegion, animated: true)
        
        // Add an annotation
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2DMake(43.1306, -77.6260)
        point.title = "Where am I?"
        point.subtitle = "I'm here!"
        mapView.addAnnotation(point)
    }
}
