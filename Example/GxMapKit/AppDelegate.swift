//
//  AppDelegate.swift
//  GxMapKit
//
//  Created by wghadwr@gmail.com on 05/07/2019.
//  Copyright (c) 2019 wghadwr@gmail.com. All rights reserved.
//

import UIKit

import GxMapKit
import BaiduMapAPI_Map
import BaiduMapAPI_Map

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, BMKGeneralDelegate {

    var window: UIWindow?

	var _mapManager: BMKMapManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
		
//		self.mapManager = MapViewController.getMapManager(key: "o0PdgT1a7922KZgRO7V35GGY5qAb4t13", delegate: self)
		_mapManager = BMKMapManager()
		// 如果要关注网络及授权验证事件，请设定generalDelegate参数
		let ret = _mapManager?.start("o0PdgT1a7922KZgRO7V35GGY5qAb4t13",
										  generalDelegate: self)
		if ret == false {
			NSLog("manager start failed!")
		}
		
		let mapView = MapViewController()
		let navigation = UINavigationController()
		navigation.pushViewController(mapView, animated: true)
		self.window?.rootViewController = navigation
		window?.makeKeyAndVisible()
		
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

	func onGetNetworkState(_ iError: Int32) {
		if 0 == iError {
			NSLog("联网成功")
		} else {
			NSLog("联网失败，错误代码：Error\(iError)")
		}
	}
	
	func onGetPermissionState(_ iError: Int32) {
		if 0 == iError {
			NSLog("授权成功")
		} else {
			NSLog("授权失败，错误代码\(iError)")
		}
	}
}

