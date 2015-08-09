//
//  ViewController.swift
//  DestinetApp
//
//  Created by Phuong Nguyen on 5/4/15.
//  Copyright (c) 2015 Destino. All rights reserved.
//

import UIKit
import iAd


class ViewController: UIViewController,UIWebViewDelegate, VungleSDKDelegate,  ChartboostDelegate{
    
     //var UIiAd:, ADBannerView = ADBannerView()
    
    @IBOutlet weak var adShow: UIButton!
    @IBOutlet weak var webView1: UIWebView!
        var WebURL = Varialbes.Static.URL
 
    var vungleSdk = VungleSDK.sharedSDK()
    
    
    //ad panel
    var AdNumber = 1
    @IBOutlet weak var AdView: UIView!
    
    @IBAction func closePanelClick(sender: AnyObject) {
        AdView.hidden = true
    }
    
    @IBAction func ShowAdClick(sender: AnyObject) {
      
        
        Chartboost.showInterstitial("Home" + String(AdNumber))
        //Chartboost.showMoreApps("Home")
        //Chartboost.showRewardedVideo("Home")
        vungleSdk.playAd(self, error: nil)
        AdNumber++
         AdColony.playVideoAdForZone("vzd576c4633e5544b8aa", withDelegate: nil)
        if(AdNumber > 7)
        {
        AdView.backgroundColor = UIColor.redColor()
        }
        println(AdNumber)
    }
    
    @IBAction func SettingClick(sender: AnyObject) {
        AdView.hidden = false
    }
    
    
    @IBAction func MoreAppClick(sender: AnyObject) {
    }
    //end ad panel
    
    
    
    
      //public var NotifyURL=""
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 
            
            
        AdView.hidden = true
        let requestURL = NSURL(string:WebURL)
        let request = NSURLRequest(URL: requestURL!)
        webView1.loadRequest(request)
        webView1.delegate = self
            
        //show chartboost
        Chartboost.showInterstitial("Home")
        //show vungle 
            vungleSdk.delegate = self
        vungleSdk.playAd(self, error: nil)
            //adcolony           
        AdColony.playVideoAdForZone("vzd576c4633e5544b8aa", withDelegate: nil)
            
    }

 
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //vungle
    
    
    // Play an ad using default settings
    @IBAction func playAd(sender: AnyObject) {
        var sdk = VungleSDK.sharedSDK()
        sdk.delegate = self
        sdk.playAd(self, error: nil)
    }
    func vungleSDKwillCloseAdWithViewInfo(viewInfo: [NSObject : AnyObject]!, willPresentProductSheet: Bool) {
        println(viewInfo)
    }
    
    //end vungle

    
    //ad
    // Add delegate functions
//    func adtapsyDidClickedAd() {
//        println("***adtapsyDidClickedAd***");
//    }
//    
//    func adtapsyDidFailedToShowAd() {
//        println("***adtapsyDidFailedToShowAd***");
//    }
//    
//    func adtapsyDidShowAd() {
//        println("***adtapsyDidShowAd***");
//    }
//    
//    func adtapsyDidSkippedAd() {
//        println("***adtapsyDidSkippedAd***");
//    }
//    
//    func adtapsyDidCachedAd() {
//        println("***adtapsyDidCachedAd***");
//    }
    //end ad
    
    //begin iad
    // 1
//    func appdelegate() -> AppDelegate {
//        return UIApplication.sharedApplication().delegate as AppDelegate
//    }
//    
//    // 2
//    override func viewWillAppear(animated: Bool) {
//        var SH = UIScreen.mainScreen().bounds.height
//        
//        UIiAd = self.appdelegate().UIiAd
//        UIiAd.frame = CGRectMake(0, SH - 50, 0, 0)
//        self.view.addSubview(UIiAd)
//        println("khoi tao ")
//        UIiAd.alpha = 0
//        UIiAd.delegate = self
//    }
//    
//    // 3
//    override func viewWillDisappear(animated: Bool) {
//        UIiAd.delegate = nil
//        UIiAd.removeFromSuperview()
//    }
//    
//    //   bannerViewWillLoadAd
//    func bannerViewWillLoadAd(banner: ADBannerView!) {
//        println("will load ")
//    }
//    
//    
//    // 4
//    func bannerViewDidLoadAd(banner: ADBannerView!) {
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(1)
//        UIiAd.alpha = 1
//        UIView.commitAnimations()
//        println("da load ")
//    }
//    
//    // 5
//    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(0)
//        UIiAd.alpha = 1
//        UIView.commitAnimations()
//        println("fail load ")
//        
//    }
    //end iad

    //web view delegate
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
        
        println("Webview fail with error \(error)");
    }
    
    func webView(webView: UIWebView!, shouldStartLoadWithRequest request: NSURLRequest!, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
       // println("Webview started Loading")
        
        
             let currentURL : NSString = (webView1.request?.URL.absoluteString)!
        
       // println(currentURL)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
       // println("Webview did finish load")
        let currentURL : String = (webView1.request?.URL.absoluteString)!
                 println(currentURL)
        
//        if (AdTapsy.isAdReadyToShow()) {
//            println("Ad is ready to be shown");
//            AdTapsy.showInterstitial(self);
//            
//        } else {
//            println("Ad is not ready to be shown");
//        }

        
    }

}

