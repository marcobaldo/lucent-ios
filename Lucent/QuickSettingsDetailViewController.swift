//
//  QuickSettingsDetailViewController.swift
//  Lucent
//
//  Created by Marc on 09/04/2016.
//  Copyright © 2016 Marc Obaldo. All rights reserved.
//

import UIKit
import Color_Picker_for_iOS

class QuickSettingsDetailViewController: UIViewController {
    
    @IBOutlet weak var colorPickerView: HRColorPickerView!
    
    
    override func loadView() {
        super.loadView();
        colorPickerView.color = UIColor.blueColor();
    }

    override func viewDidLoad() {
        super.viewDidLoad();

        colorPickerView.addTarget(self, action: "colorDidChange:", forControlEvents: UIControlEvents.ValueChanged);
    }
    
    func colorDidChange(sender : HRColorPickerView) {
        
    }

}
