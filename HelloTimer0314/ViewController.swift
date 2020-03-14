//
//  ViewController.swift
//  HelloTimer0314
//
//  Created by 棟樑許 on 2020/3/14.
//  Copyright © 2020 棟樑許. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer!
    var counter = 0.0
    
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let org = CGPoint(x: 0, y: 20)
//        let size = CGSize(width: 100, height: 100)
//        let rect = CGRect(origin: org, size: size)
//        var newView = UIView.init(frame: rect)
//        //var newView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        newView.backgroundColor = UIColor.red
//        self.view.addSubview(newView)
        var newView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let rotationangle = CGFloat(30 * M_PI / 180)
        newView.transform = CGAffineTransform(rotationAngle: 0)
        newView.backgroundColor = UIColor.red
        newView.center = self.view.center
        self.view.addSubview(newView)
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (theTimer) in
            self.rotateView(theView: newView)
        })
    }
    
    func rotateView(theView:UIView){
        let angle = CGFloat(counter * M_PI / 180)
        theView.transform = CGAffineTransform(rotationAngle: angle)
        counter += 4
        print(counter)
    }
}

