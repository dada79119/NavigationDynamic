//
//   FontStyle.swift
//  astronomy
//
//  Created by dada on 2021/7/20.
//

import Foundation
import UIKit

final class FontStyle{
    static let sharedInstance:FontStyle = FontStyle()
    
    private let fontName = "Helvetica"
    private let fontNameBlod = "Helvetica-Bold"
    
    // MARK: - 自訂方法
    func getFontSize10()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 10)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 14)!
        }else{
            return UIFont(name: fontName, size: 10)!
        }
    }
    
    func getFontSize12()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 12)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 15)!
        }else{
            return UIFont(name: fontName, size: 12)!
        }
    }
    
    func getFontSize13()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 13)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 15)!
        }else{
            return UIFont(name: fontName, size: 13)!
        }
    }
    
    func getFontSize14()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 14)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 14)!
        }else{
            return UIFont(name: fontName, size: 14)!
        }
    }
    
    func getFontSize15()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 16)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 16)!
        }else{
            return UIFont(name: fontName, size: 15)!
        }
    }
    
    func getFontSize16()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 16)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 16)!
        }else{
            return UIFont(name: fontName, size: 16)!
        }
    }
    func getFontSize17()->UIFont{
        return UIFont(name: fontName, size: 17)!
    }
    
    func getFontSize18()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 18)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 18)!
        }else{
            return UIFont(name: fontName, size: 18)!
        }
    }
    
    func getFontSize20()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 20)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 20)!
        }else{
            return UIFont(name: fontName, size: 20)!
        }
    }
    
    func getFontSize20to28()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 16)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 16)!
        }else{
            return UIFont(name: fontName, size: 20)!
        }
    }
    
    func getFontSize13Bold()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontNameBlod, size: 13)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontNameBlod, size: 16)!
        }else{
            return UIFont(name: fontNameBlod, size: 13)!
        }
    }
    
    func getFontSize14Bold()->UIFont{
           if UIScreen.main.bounds.size.height == 667 {
               return UIFont(name: fontNameBlod, size: 16)!
           } else if UIScreen.main.bounds.size.height == 736 {
               return UIFont(name: fontNameBlod, size: 16)!
           }else{
               return UIFont(name: fontNameBlod, size: 14)!
           }
       }
    
    func getFontSize15Bold()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontNameBlod, size: 16)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontNameBlod, size: 16)!
        }else{
            return UIFont(name: fontNameBlod, size: 15)!
        }
    }
    
    
    func getFontSize16Bold()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontNameBlod, size: 16)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontNameBlod, size: 16)!
        }else{
            return UIFont(name: fontNameBlod, size: 16)!
        }
    }
    
    func getFontSize18Blod()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontNameBlod, size: 18)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontNameBlod, size: 18)!
        }else{
            return UIFont(name: fontNameBlod, size: 18)!
        }
    }
    
    func getFontSize20Blod()->UIFont{
        return UIFont(name: fontNameBlod, size: 20)!
    }
    
    func getFontSize22Blod()->UIFont{
        return UIFont(name: fontNameBlod, size: 22)!
    }
    
    func getFontSize24()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontName, size: 24)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontName, size: 24)!
        }else{
            return UIFont(name: fontName, size: 24)!
        }
    }
    
    func getFontSize19Blod()->UIFont{
        if UIScreen.main.bounds.size.height == 667 {
            return UIFont(name: fontNameBlod, size: 16)!
        } else if UIScreen.main.bounds.size.height == 736 {
            return UIFont(name: fontNameBlod, size: 16)!
        }else{
            return UIFont(name: fontNameBlod, size: 18)!
        }
    }
}
