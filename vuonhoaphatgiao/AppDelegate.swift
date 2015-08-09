//
//  AppDelegate.swift
//  DestinetApp
//
//  Created by Phuong Nguyen on 5/4/15.
//  Copyright (c) 2015 Destino. All rights reserved.
//

import UIKit
//import iAd
 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ChartboostDelegate {

    var window: UIWindow?
    //var UIiAd: ADBannerView = ADBannerView()
    
var conmeno=""

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //AdTapsy.startSession("55adef9de4b05507958fa288");
        
        Chartboost.startWithAppId("55afa81d04b0167f0acea7ee", appSignature: "abe69787ea36ddaed35309762c5a0b493c2fb83f", delegate: self)
        
        //vungle
        // Override point for customization after application launch.
        var appID = "1007059414"
        var sdk = VungleSDK.sharedSDK()
        // start vungle publisher library
        sdk.startWithAppId(appID)
        sdk.setLoggingEnabled(true)
        
        //end vung le
//adcolony\
        AdColony.configureWithAppID("appb25b1e352e744ed18f", zoneIDs: ["vzd576c4633e5544b8aa"], delegate: nil, logging: true)
        
        return true
    }
 

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

