//
//  ViewController.swift
//  MamAnger
//
//  Created by Rahmadani Pratiwi on 16/05/19.
//  Copyright © 2019 Rahmadani Pratiwi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundColor: UIView!
    @IBOutlet weak var colorSlider: UISlider!
    @IBOutlet weak var circle1: UIView!
    
    var red: Float = 0
    
    func angerMeter() {
        red = self.colorSlider.value
        self.backgroundColor.backgroundColor = UIColor(red: CGFloat(red), green: 0, blue: 0, alpha: 1.0)
    }
    
    
    @IBAction func sliderAction(_ sender: Any) {
        self.angerMeter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myNewView = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        myNewView.layer.cornerRadius = 25
        //            myNewView.frame.size.width / 2
        myNewView.backgroundColor = UIColor.white
        view.addSubview(myNewView)
        
        circle1.rounded()
        
    }
}

extension UIView {
    func rounded(){
        self.backgroundColor = .black
        self.layer.cornerRadius = self.frame.size.width/2
    }
}

