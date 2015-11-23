//
//  ViewController.swift
//  Lab5
//
//  Created by Daniel Rankin on 10/14/15.
//  Copyright (c) 2015 Daniel Rankin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    
    
    
    override func viewDidLoad() {
        
        mapView.mapType=MKMapType.Standard
        var status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status==CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.distanceFilter=kCLDistanceFilterNone
        mapView.showsUserLocation=true
        
        super.viewDidLoad()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(manager.location.coordinate,span)
        mapView.setRegion(region, animated: true)
        annotation.coordinate=manager.location.coordinate
        annotation.title="THIS BE YOU"
        annotation.subtitle="Lat: \(manager.location.coordinate.latitude), Long: \(manager.location.coordinate.longitude)"
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status==CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
        }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        var errorType=String()
        if let clError=CLError(rawValue: error.code) {
            if clError == .Denied {
                errorType="access denied"
                let alert=UIAlertController (title: "Error", message: errorType, preferredStyle: UIAlertControllerStyle.Alert)
                let okAction:UIAlertAction=UIAlertAction(title:"OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

