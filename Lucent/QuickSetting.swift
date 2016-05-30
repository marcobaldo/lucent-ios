//
//  QuickSetting.swift
//  Lucent
//
//  Created by Marc on 28/05/2016.
//  Copyright © 2016 Marc Obaldo. All rights reserved.
//

import Foundation
import UIKit

struct PropertyKey {
    static let mode = "mode";
    static let name = "name";
    static let options = "options";
}

class QuickSetting :NSObject, NSCoding {
    let mode : LucentMode
    let name : String
    let options : String
    
    init(mode:LucentMode, name:String, options:String) {
        self.mode = mode
        self.name = name
        self.options = options
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.mode = LucentMode(rawValue: aDecoder.decodeIntegerForKey(PropertyKey.mode))!
        self.name = aDecoder.decodeObjectForKey(PropertyKey.name) as! String
        self.options = aDecoder.decodeObjectForKey(PropertyKey.options) as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(self.mode.rawValue, forKey:PropertyKey.mode)
        aCoder.encodeObject(self.name, forKey:PropertyKey.name)
        aCoder.encodeObject(self.options, forKey:PropertyKey.options)
    }
    
    func getBackgroundColor() -> UIColor {
        if self.mode == LucentMode.Off {
            return UIColor(colorLiteralRed: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    
        if self.mode == LucentMode.Static || self.mode == LucentMode.Breathing {
            let options = self.options
            
            let r = options.substringWithRange(Range<String.Index>(options.startIndex.advancedBy(0) ... options.startIndex.advancedBy(2)))
            let g = options.substringWithRange(Range<String.Index>(options.startIndex.advancedBy(3) ... options.startIndex.advancedBy(5)))
            let b = options.substringWithRange(Range<String.Index>(options.startIndex.advancedBy(6) ... options.startIndex.advancedBy(8)))
            let a = options.substringWithRange(Range<String.Index>(options.startIndex.advancedBy(9) ... options.startIndex.advancedBy(11)))
            
            return UIColor(colorLiteralRed: Float(r)!, green: Float(g)!, blue: Float(b)!, alpha: Float(a)!)

        }
        
        return UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func getForegroundColor() -> UIColor {
        return getContrastColor(getBackgroundColor())
    }
    
    private func getContrastColor(color : UIColor) -> UIColor {
        var output:Float = 0
        let rgb = color.rgb()
        
        // Calculate luminance
        let r = 0.299 * Double((rgb?.red)!)
        let g = 0.587 * Double((rgb?.green)!)
        let b = 0.114 * Double((rgb?.blue)!)
        
        let luminance:Double = 1 - (r + g + b) / 255
        
        if (luminance < 0.5) {
            output = 0
        } else {
            output = 255
        }
        
        return UIColor(colorLiteralRed: output / 255.0, green: output / 255.0, blue: output / 255.0, alpha: 1.0);
    }
}

extension UIColor {
    
    func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}