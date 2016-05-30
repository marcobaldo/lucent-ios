//
//  SetupViewController.swift
//  Lucent
//
//  Created by Marc on 29/05/2016.
//  Copyright © 2016 Marc Obaldo. All rights reserved.
//

import UIKit
import ParticleDeviceSetupLibrary
import ParticleSDK

class SetupViewController : UIViewController, SparkSetupMainControllerDelegate {
    
    override func viewDidAppear(animated: Bool) {
        
        let cust = SparkSetupCustomization.sharedInstance()
        cust.deviceName = "Lumos"
        cust.brandName = "Lumos"
        
        if let setupController = SparkSetupMainController()
        {
            setupController.delegate = self
            self.presentViewController(setupController, animated: true, completion: nil)
        }
        
    }
    
    func loadSplitView() {
        // Override point for customization after application launch.
        let splitViewController = GlobalSplitViewController()
        
        let leftNavController = splitViewController.viewControllers.first as! UINavigationController
        let masterViewController = leftNavController.topViewController as! QuickSettingsViewController
        let detailViewController = splitViewController.viewControllers.last as! QuickSettingsDetailViewController
        
        let firstSetting = masterViewController.profiles.first
        detailViewController.quickSetting = firstSetting
        
        masterViewController.delegate = detailViewController
    }
    
    func sparkSetupViewController(controller: SparkSetupMainController!, didFinishWithResult result: SparkSetupMainControllerResult, device: SparkDevice!) {
        print("result: \(result), and device: \(device)")
        
        
    }
    
}
