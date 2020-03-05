//
//  NorthPole.swift
//  FavoritePlaces
//
//  Created by Ellie on 3/5/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class NorthPole: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(80, 0)
    }
    
    var title: String? {
        return "The North Pole"
    }
    
    var subtitle: String? {
        return "Santa's Workshop"
    }
}
