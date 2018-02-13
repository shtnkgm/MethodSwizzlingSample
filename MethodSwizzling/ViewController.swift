//
//  ViewController.swift
//  MethodSwizzling
//
//  Created by Shota Nakagami on 2018/02/13.
//  Copyright © 2018年 Shota Nakagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        let swizzlingViewController = SwizzlingViewController()
        
        let before: Method = class_getInstanceMethod(SwizzlingViewController.self, #selector(viewDidLoad))!
        let after: Method = class_getInstanceMethod(ViewController.self, #selector(mockViewDidLoad))!
        method_exchangeImplementations(before, after)
        
        present(swizzlingViewController, animated: true, completion: nil)
    }
    
    @objc func mockViewDidLoad() {
        print(#function)
    }
}

class SwizzlingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
}

