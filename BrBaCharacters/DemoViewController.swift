//
//  DemoViewController.swift
//  BrBaCharacters
//
//  Created by Milan Chalishajarwala on 10/24/20.
//

import UIKit

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.frame = self.view.bounds
        // First, add the view of the child to the view of the parent
        self.view.addSubview(child.view)
        // Then, add the child to the parent
        self.addChild(child)
    }
    

    
}
