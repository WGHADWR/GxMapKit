//
//  MapViewController.swift
//  GxMapKit
//
//  Created by GXHC on 2019/5/7.
//

import Foundation
import UIKit

import BaiduMapAPI_Map

open class MapViewController: UIViewController {
	
	public static func getMapManager(key: String, delegate: BMKGeneralDelegate) -> BMKMapManager? {
		let mapManager = BMKMapManager()
		// 如果要关注网络及授权验证事件，请设定generalDelegate参数
		let ret = mapManager.start(key, generalDelegate: delegate)
		if (ret) {
			return mapManager
		}
		return nil
	}
	
	var _mapView: BMKMapView?
	
	override open func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.title = "Map"
		let rightButtonItem = UIBarButtonItem.init(title: "确定", style: UIBarButtonItem.Style.done, target: self, action: #selector(onComplete))
		self.navigationItem.rightBarButtonItem = rightButtonItem
		
		// Do any additional setup after loading the view.
		_mapView = BMKMapView(frame: CGRect(x: 0, y: 0,
											width: self.view.frame.width,
											height: self.view.frame.height))
		_mapView?.mapType = BMKMapType.standard
		// _mapView?.overlooking = 0
		_mapView?.isOverlookEnabled = false;
		_mapView?.isRotateEnabled = false
		self.view.addSubview(_mapView!)
		
		self.addZoomControl()
	}
	
	override open func viewDidAppear(_ animated: Bool) {
		
		//地图中心点坐标
		let center = CLLocationCoordinate2D(latitude: 31.245087, longitude: 121.506656)
		//设置地图的显示范围（越小越精确）
		let span = BMKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
		//设置地图最终显示区域
		let region = BMKCoordinateRegion(center: center, span: span)
		_mapView?.region = region
		
		
		self.addMapMarker(coord: CLLocationCoordinate2D(latitude: 31.254, longitude: 121.5126), title: "这里有只野生皮卡丘")
	}
	
	@objc func onComplete() {
		let point = _mapView?.getMapStatus()?.targetGeoPt
		print(point as Any)
		
		self.navigationController?.popViewController(animated: true)
	}
	
	// 添加一个标记点(PointAnnotation）
	func addMapMarker(coord: CLLocationCoordinate2D, title: String) {
		let annotation =  BMKPointAnnotation()
		annotation.coordinate = coord
		annotation.title = title
		_mapView!.addAnnotation(annotation)
	}
	
	func addZoomControl() {
		let zoomCtrlWidth = CGFloat(38.0)
		let contrlView = UIView()
		// frame: CGRect(x: 0, y: 200, width: 60, height: 120)
		contrlView.backgroundColor = UIColor.white
		contrlView.layer.cornerRadius = 5
		contrlView.layer.borderColor = UIColor.lightGray.cgColor
		contrlView.layer.borderWidth = 0.5
		self._mapView?.addSubview(contrlView)
		contrlView.translatesAutoresizingMaskIntoConstraints = false
		
		let widthConstraint = NSLayoutConstraint(item: contrlView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: zoomCtrlWidth)
		let heightConstraint = NSLayoutConstraint(item: contrlView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: zoomCtrlWidth * 2)
		
		let rightConstraint = NSLayoutConstraint(item: contrlView, attribute: .right
			, relatedBy: .equal, toItem: contrlView.superview, attribute: .right, multiplier: 1.0, constant: -20)
		let bottomConstraint = NSLayoutConstraint(item: contrlView, attribute: .bottom, relatedBy: .equal, toItem: contrlView.superview, attribute: .bottom, multiplier:1.0, constant: -30)
		
		contrlView.addConstraints([widthConstraint, heightConstraint])
		contrlView.superview?.addConstraints([ rightConstraint, bottomConstraint ])
		
		let textColor = UIColor.gray // UIColor(red: 33, green: 33, blue: 33, alpha: 1)
		let btnZoomIn = UIButton(frame: CGRect(x: 0, y: 0, width: zoomCtrlWidth, height: zoomCtrlWidth))
		btnZoomIn.setTitle("+", for: UIControl.State.normal)
		btnZoomIn.setTitleColor(textColor, for: UIControl.State.normal)
		btnZoomIn.addTarget(self, action: #selector(zoomIn), for: UIControl.Event.touchUpInside)
		
		let btnZoomOut = UIButton(frame: CGRect(x: 0, y: zoomCtrlWidth, width: zoomCtrlWidth, height: zoomCtrlWidth))
		btnZoomOut.setTitle("-", for: UIControl.State.normal)
		btnZoomOut.setTitleColor(textColor, for: UIControl.State.normal)
		btnZoomOut.addTarget(self, action: #selector(zoomOut), for: UIControl.Event.touchUpInside)
		
		contrlView.addSubview(btnZoomIn)
		contrlView.addSubview(btnZoomOut)
	}
	
	@objc func zoomIn() {
		let level = self._mapView?.zoomLevel
		self._mapView?.zoomLevel = level! + 1
	}
	
	@objc func zoomOut() {
		let level = self._mapView?.zoomLevel
		self._mapView?.zoomLevel = level! - 1
	}
	
}


