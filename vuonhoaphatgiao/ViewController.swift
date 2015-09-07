//
//  ViewController.swift
//  DestinetApp
//
//  Created by Phuong Nguyen on 5/4/15.
//  Copyright (c) 2015 Destino. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,UIWebViewDelegate,GADBannerViewDelegate{
    
    
    @IBOutlet weak var gBannerView: GADBannerView!
    
    //@IBOutlet weak var adShow: UIButton!
    @IBOutlet weak var webView1: UIWebView!
        var WebURL = Varialbes.Static.URL
    //ad panel
    //@IBOutlet weak var textViewAdInfo: UITextView!
   
    
    @IBAction func MoreAppClick(sender: AnyObject) {
        var barsLink : String = "itms-apps://itunes.apple.com/ca/artist/phuong-nguyen/id1004963752"
        UIApplication.sharedApplication().openURL(NSURL(string: barsLink)!)
    }
    //end ad panel
    
      //public var NotifyURL=""
        override func viewDidLoad() {
        super.viewDidLoad()
           // textViewAdInfo.hidden = true
 
       
        let requestURL = NSURL(string:WebURL)
        let request = NSURLRequest(URL: requestURL!)
        webView1.loadRequest(request)
        webView1.delegate = self
            
            ShowAdmobBanner()
            
    }

    func ShowAdmobBanner()
    {
        //gBannerView = GADBannerView(frame: CGRectMake(0, 20 , 320, 50))
        gBannerView?.adUnitID = "ca-app-pub-7800586925586997/3166781265"
        gBannerView?.delegate = self
        gBannerView?.rootViewController = self
        //self.view.addSubview(bannerView!)
        //adViewHeight = bannerView!.frame.size.height
        var request = GADRequest()
        request.testDevices = [kGADSimulatorID , "8c5c2bcfed6ce10d63a11d9a591e15c2"];
        gBannerView?.loadRequest(request)
        gBannerView?.hidden = true
        
    }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

   
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
        
    }
    
    //admob delegate
    
    //admob delegate
    //GADBannerViewDelegate
    func adViewDidReceiveAd(view: GADBannerView!) {
        println("adViewDidReceiveAd:\(view)");
        gBannerView?.hidden = false
        
        //relayoutViews()
    }
    
    func adView(view: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        println("\(view) error:\(error)")
        gBannerView?.hidden = false
        //relayoutViews()
    }
    
    func adViewWillPresentScreen(adView: GADBannerView!) {
        println("adViewWillPresentScreen:\(adView)")
        gBannerView?.hidden = false
        
        //relayoutViews()
    }
    
    func adViewWillLeaveApplication(adView: GADBannerView!) {
        println("adViewWillLeaveApplication:\(adView)")
    }
    
    func adViewWillDismissScreen(adView: GADBannerView!) {
        println("adViewWillDismissScreen:\(adView)")
        
        // relayoutViews()
    }

}

