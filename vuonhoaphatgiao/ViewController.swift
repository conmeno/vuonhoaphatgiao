//
//  ViewController.swift
//  DestinetApp
//
//  Created by Phuong Nguyen on 5/4/15.
//  Copyright (c) 2015 Destino. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController,UIWebViewDelegate, AdTapsyDelegate  {
    
     //var UIiAd: ADBannerView = ADBannerView()
    
    @IBOutlet weak var adShow: UIButton!
    @IBOutlet weak var webView1: UIWebView!
        var WebURL = Varialbes.Static.URL
 
      //public var NotifyURL=""
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 
        
        let requestURL = NSURL(string:WebURL)
        let request = NSURLRequest(URL: requestURL!)
        webView1.loadRequest(request)
              webView1.delegate = self;
          //  self.canDisplayBannerAds = true
        AdTapsy.setDelegate(self);
            
            
        
    }

//    @IBAction func TabClick(sender: UITapGestureRecognizer) {
//        
//        println("double click")
//    }
//    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ad
    // Add delegate functions
    func adtapsyDidClickedAd() {
        println("***adtapsyDidClickedAd***");
    }
    
    func adtapsyDidFailedToShowAd() {
        println("***adtapsyDidFailedToShowAd***");
    }
    
    func adtapsyDidShowAd() {
        println("***adtapsyDidShowAd***");
    }
    
    func adtapsyDidSkippedAd() {
        println("***adtapsyDidSkippedAd***");
    }
    
    func adtapsyDidCachedAd() {
        println("***adtapsyDidCachedAd***");
    }
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
        println("Webview started Loading")
        
        
             let currentURL : NSString = (webView1.request?.URL.absoluteString)!
        
        println(currentURL)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        println("Webview did finish load")
        let currentURL : String = (webView1.request?.URL.absoluteString)!
                 println(currentURL)
        
        if (AdTapsy.isAdReadyToShow()) {
            println("Ad is ready to be shown");
            AdTapsy.showInterstitial(self);
            
        } else {
            println("Ad is not ready to be shown");
        }

        
    }

}

