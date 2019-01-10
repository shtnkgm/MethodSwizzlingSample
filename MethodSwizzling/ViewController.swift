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
        swizzling()
        let targetgViewController = TargetViewController()
        present(targetgViewController, animated: true, completion: nil)
    }
    
    func swizzling() {
        let before: Method = class_getInstanceMethod(UIViewController.self, #selector(viewDidLoad))!
        let after: Method = class_getInstanceMethod(UIViewController.self, #selector(hoge))!
        method_exchangeImplementations(before, after)
    }
}

extension UIViewController {
    @objc func hoge() {
        print(#function)
    }
}

