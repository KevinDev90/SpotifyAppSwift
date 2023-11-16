//
//  Extensions.swift
//  Spotify
//
//  Created by Kevin Guzman on 28/08/23.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        return frame.size.width
    }
    
    var heigth: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return top + heigth
    }
}
