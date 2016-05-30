//
//  QuickSettingsDetailViewController.swift
//  Lucent
//
//  Created by Marc on 09/04/2016.
//  Copyright © 2016 Marc Obaldo. All rights reserved.
//

import UIKit
import Color_Picker_for_iOS

class QuickSettingsDetailViewController: UIViewController, QuickSettingSelectionDelegate {
    
    @IBOutlet weak var colorPickerView: HRColorPickerView!
    @IBOutlet weak var profileNameTextField: UITextField!
    
    private var _color : UIColor!
    
    var quickSetting : QuickSetting! {
        didSet(newSetting) {
            self.refreshUI();
        }
    }
    
    override func loadView() {
        super.loadView();
        colorPickerView.color = UIColor.blueColor();
        _color = colorPickerView.color;
    }

    override func viewDidLoad() {
        super.viewDidLoad();

        colorPickerView.addTarget(self, action: #selector(colorDidChange), forControlEvents: UIControlEvents.ValueChanged);
        refreshUI();
    }
    
    func colorDidChange(sender : HRColorPickerView) {
        _color = sender.color;
    }
    
    func quickSettingSelected(setting: QuickSetting) {
        quickSetting = setting;
    }
    
    func refreshUI() {
        let options = quickSetting.options as String
        
        profileNameTextField?.text = quickSetting.name
        
        switch (quickSetting.mode) {
        case LucentMode.Off:
            colorPickerView?.hidden = true;
            break;
        case LucentMode.Static:
            colorPickerView?.hidden = false;
            let r = options.substringWithRange(Range<String.Index>(options.startIndex.advancedBy(0) ... options.startIndex.advancedBy(2)))
            let g = options.substringWithRange(Range<String.Index>(options.startIndex.advancedBy(3) ... options.startIndex.advancedBy(5)))
            let b = options.substringWithRange(Range<String.Index>(options.startIndex.advancedBy(6) ... options.startIndex.advancedBy(8)))
            let a = options.substringWithRange(Range<String.Index>(options.startIndex.advancedBy(9) ... options.startIndex.advancedBy(11)))
            
            _color = UIColor(colorLiteralRed: Float(r)!, green: Float(g)!, blue: Float(b)!, alpha: Float(a)!)
            colorPickerView.color = _color
            
            break;
        default:
            break;
        }
    }

}
