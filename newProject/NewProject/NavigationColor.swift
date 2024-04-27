//
//  File.swift
//  newProject
//
//  Created by Admin on 25/04/24.
//

import UIKit

extension UINavigationController {
    
    func setup() {
        let navi = UINavigationBarAppearance()
        navi.configureWithOpaqueBackground()
        
        navi.backgroundColor = .white
        navi.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navi.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationBar.standardAppearance = navi
        self.navigationBar.scrollEdgeAppearance = navi
        self.navigationBar.compactAppearance = navi
        
        //self.navigationBar.tintColor = .blue
        //UIBarButtonItem.appearance().tintColor = .white
    }
    
}
