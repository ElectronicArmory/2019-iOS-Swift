//
//  ViewController.swift
//  LocationMaps
//
//  Created by Mike Z on 10/22/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager()
    
    
    
    fileprivate func updateMap(newGPSLocation:CLLocationCoordinate2D) {
        
       
//        mapView.setCenter(newGPSLocation, animated: true)
        let mapRegion:MKCoordinateRegion = MKCoordinateRegion(center: newGPSLocation, span: MKCoordinateSpan(latitudeDelta: 0.01,longitudeDelta: 0.01))
        mapView.setRegion(mapRegion, animated: true)
        
        let geofenceRegion = CLCircularRegion(center: newGPSLocation, radius: 50.0, identifier: "Boise")
        locationManager.stopMonitoring(for: geofenceRegion)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        LocationController.startLocationMonitoring()
        
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        
        locationManager.distanceFilter = 1
//        locationManager.desiredAccuracy = .
        
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations[0])
        updateMap(newGPSLocation: locations[0].coordinate)
    }

}

