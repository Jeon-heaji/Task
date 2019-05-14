//
//  ViewController.swift
//  20190510MapKitTask
//
//  Created by Jeon-heaji on 13/05/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//
import MapKit
import UIKit


class ViewController: UIViewController {
    
    var placeArr = [CLLocationCoordinate2D]()
    
    let textfield: UITextField = {
        let textfiedl = UITextField()
        textfiedl.translatesAutoresizingMaskIntoConstraints = false
        textfiedl.borderStyle = .roundedRect
        return textfiedl
        
    }()
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    var num = 0
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textfield)
        view.addSubview(mapView)
        textfield.placeholder = "입력하세요!"
        autoLayout()
        textfield.delegate = self
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.showsCompass = true

    }
    //
    func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true) //1
        
    }
    // 핀
    func addAnnotation(coordinate: CLLocationCoordinate2D, subtitle: String) {
        num += 1
        
        let annotation = MKPointAnnotation()
        annotation.subtitle = subtitle
        annotation.title = "\(num)번째행선지"
        annotation.coordinate = coordinate
        
        mapView.addAnnotation(annotation)
    }
    // 사각형
    func addSquare(coordinate: CLLocationCoordinate2D) {
        let center = mapView.centerCoordinate
        
        let squareSize = 0.005
        var point1 = center; point1.latitude += squareSize; point1.longitude -= squareSize
        var point2 = center; point2.latitude += squareSize; point2.longitude += squareSize
        var point3 = center; point3.latitude -= squareSize; point3.longitude += squareSize
        var point4 = center; point4.latitude -= squareSize; point4.longitude -= squareSize
        
        let points: [CLLocationCoordinate2D] = [
            point1, point2, point3, point4, point1
        ]
        let polyline = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyline)
        
    }
    
    //autoLayout
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: guide.topAnchor, constant: 5),
            textfield.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            textfield.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            textfield.heightAnchor.constraint(equalToConstant: 40),
            
            mapView.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            ])
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let addr = textfield.text!
        geocoder.geocodeAddressString(addr) { (placeMark, error) in
            guard let placeMark = placeMark?.first else { return }
            self.setRegion(coordinate: placeMark.location!.coordinate)
            self.addAnnotation(coordinate: placeMark.location!.coordinate, subtitle: addr)
            
            self.placeArr.append(placeMark.location!.coordinate)
            
            let polyline1 = MKPolyline(coordinates: self.placeArr, count: self.placeArr.count)
            self.mapView.addOverlay(polyline1)
            
            // 2초 딜레이
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [placeMark] in
                self.addSquare(coordinate: placeMark.location!.coordinate)
            })
         
        }
        
        return true
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            renderer.lineWidth = 2
            return renderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
    
}
