//  FavoritePlaces
//
//  Created by Bryan French on 7/31/15.
//  Copyright (c) 2015 Bryan French. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView : MKMapView!
    var landmarkList = Landmarks()
    var landmarks : [Landmark] { // Front end for LandmarkList model object
        get {
            return self.landmarkList.landmarkList
        }
        set(val) {
            self.landmarkList.landmarkList = val
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let np = NorthPole()
        mapView.addAnnotation(np)
        
        mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for landmark: MKAnnotation in landmarks {
            mapView.addAnnotation(landmark)
        }
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        let annotation = view.annotation
        print("The title of the annotation is: \(String(describing:annotation?.title))")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view: MKPinAnnotationView
        let identifier = "Pin"
        
        if annotation is MKUserLocation {
            // Will use the default
            return nil
        }
        
        if annotation !== mapView.userLocation {
            // Look for a view to reuse
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            }
            // Otherwise, create one
            else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.pinTintColor = MKPinAnnotationView.purplePinColor()
                view.animatesDrop = true
                // canShowCallout = true makes annnotation.title required instead of optional
                view.canShowCallout = true
                // infoLight and detailDisclosure look the same
                let leftButton = UIButton(type: .infoLight)
                let rightButton = UIButton(type: .detailDisclosure)
                leftButton.tag = 0
                rightButton.tag = 1
                
                view.leftCalloutAccessoryView = leftButton
                view.rightCalloutAccessoryView = rightButton
            }
            return view
        }
        
        // Will use the default
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Control tapped: \(control), tag number = \(control.tag)")
    }
}

