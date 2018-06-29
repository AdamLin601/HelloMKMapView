//
//  ViewController.swift
//  HelloMKMapView
//
//  Created by 林奕德 on 2018/3/27.
//  Copyright © 2018年 AppsAdamLin. All rights reserved.
//

import UIKit
import MapKit //map
class ViewController: UIViewController {
    
    @IBAction func addMeAnnotation(_ sender: UILongPressGestureRecognizer) {
       let touchPoint = sender.location(in: map) // 手指螢幕座標
        let tounchCoordinate:CLLocationCoordinate2D =  map.convert(touchPoint, toCoordinateFrom: map) //螢幕座標轉地圖座標
        
        let Annotation = MKPointAnnotation() //產生大頭針
        Annotation.coordinate = tounchCoordinate  //設定座標
        Annotation.title = "New Place"  //標題
        Annotation.subtitle = "One day I want be here" //副標題
        map.addAnnotation(Annotation) //大頭針放入地圖
        
    }
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude :CLLocationDegrees = 48.858547 //緯度
        let longitude :CLLocationDegrees = 2.294524 // 經度
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude) // 座標
        let xScale:CLLocationDegrees = 0.01 //數字愈小 放倍越大  1為不變
        let yScale:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: xScale, longitudeDelta: yScale) //放大比例 span(廣度)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)//region
        map.setRegion(region, animated: true) //顯示
        //  map.mapType = .satellite //地圖顯示種類 .xxx 為enum 方式 避免手寫錯

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

