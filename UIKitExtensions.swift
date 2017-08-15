//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 20/7/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func wrappedInNavigation() -> UINavigationController{
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}
