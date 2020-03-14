//
//  ViewController.swift
//  HelloTimer0314
//
//  Created by 棟樑許 on 2020/3/14.
//  Copyright © 2020 棟樑許. All rights reserved.
//

import UIKit

enum segment:Int {
    case positive = 0
    case stop = 1
    case reverse = 2
}

class ViewController: UIViewController {

    var timer:Timer!
    var counter = 0.0
    
    @IBOutlet weak var theSegment: UISegmentedControl!
    
    @IBOutlet weak var speedSlider: UISlider!
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let org = CGPoint(x: 0, y: 20)
        let size = CGSize(width: 100, height: 100)
        let rect = CGRect(origin: org, size: size)
        var newView = UIView.init(frame: rect)
        //var newView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        newView.transform = CGAffineTransform(rotationAngle: 0)
        newView.backgroundColor = UIColor.red
        newView.center = self.view.center
        newView.layer.cornerRadius = 15
        newView.clipsToBounds = true
        self.view.addSubview(newView)
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true
            , block: { (theTimer) in
                self.rotateView(theView: newView)
        })
//        var newView = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        let rotationangle = CGFloat(30 * M_PI / 180)
//        newView.transform = CGAffineTransform(rotationAngle: 0)
//        newView.backgroundColor = UIColor.red
//        newView.center = self.view.center
//        self.view.addSubview(newView)
//        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (theTimer) in
//            self.rotateView(theView: newView)
//        })
    }
    
    func rotateView(theView:UIView){
        let angle = CGFloat(counter * M_PI / 180)
        theView.transform = CGAffineTransform(rotationAngle: angle)
//        if theSegment.selectedSegmentIndex == 0 {
//            counter += 4
//        }else{
//            counter -= 4
//        }
        switch theSegment.selectedSegmentIndex {
        case 0:
            //counter += 4
            counter += Double(speedSlider.value)
        case 1:
            break
        case 2:
            //counter -= 4
            counter -= Double(speedSlider.value)
        default:
            break
        }
        //print(counter)
    }
    
    @IBAction func theChangeSegment(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
    @IBAction func speedChanged(_ sender: UISlider) {
        print(sender.value)
    }
}

