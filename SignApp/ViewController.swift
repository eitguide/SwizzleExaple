//
//  ViewController.swift
//  SignApp
//
//  Created by Nguyen Van Nghia on 6/10/20.
//  Copyright © 2020 Nguyen Van Nghia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(UIColor.red)
        
        print(UIColor.red)
        
        print(UIColor.red)
        
        UIColor.activeSwizzle()
        
        print(UIColor.red)
        
        print(UIColor.red)
        
        print(UIColor.red)
        
        print(UIColor.red)
        
        
        print(UIScreen.main.scale)
        
        UIScreen.activeSwizzle()
        
        print(UIScreen.main.scale)
        print(UIScreen.main.scale)
        
    }
}


extension UIScreen {
    
    @objc func scaleABC() -> CGFloat {
        print("scaleABC")
        return 5
    }
    
    private static let swizzleScaleImplementation: Void = {
        let screenInstance = UIScreen.main
        let screenClass = object_getClass(screenInstance)
        let screenScale = class_getInstanceMethod(screenClass, #selector(getter: UIScreen.scale))
        let replaceScale = class_getInstanceMethod(screenClass, #selector(UIScreen.scaleABC))
        method_exchangeImplementations(screenScale!, replaceScale!)
    }()
    
    public static func activeSwizzle() {
        _ = swizzleScaleImplementation
    }
}

extension UIColor {
    @objc func colorDescription() -> String {
        return "colorDescription"
    }
    
    private static let swizzleDescriptionImplementation: Void = {
        
        let instance: UIColor = UIColor.red
        
        let aClass: AnyClass! = object_getClass(instance)
        
        let oringinalMethod = class_getInstanceMethod(aClass, #selector(UIColor.description))
        let swizzledMethod = class_getInstanceMethod(aClass, #selector(UIColor.colorDescription))
        
        method_exchangeImplementations(oringinalMethod!, swizzledMethod!)
    }()


    public static func activeSwizzle() {
        _ = swizzleDescriptionImplementation
    }

}

