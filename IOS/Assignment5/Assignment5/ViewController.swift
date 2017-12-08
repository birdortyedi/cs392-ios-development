//
//  ViewController.swift
//  Assignment5
//
//  Created by Kinli, Furkan(AWF) on 09/11/17.
//  Copyright © 2017 Kinli, Furkan(AWF). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label: UILabel!
    
    var end : String = "\(0)"
    var divOfX : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let x_ : Int = (Int(screenSize.width))/4
        divOfX = x_
        let y_ : Int = 60
        
        scrollView.contentSize = CGSize(width: x_ * 16, height: y_)
        let maximumNumber = 10
        
        for i in 0...maximumNumber{
            let label = UILabel(frame: CGRect(x: i*x_, y: 0, width: x_, height: y_))
            label.text = "\(i)"
            label.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256)) / 256.0, green: CGFloat(arc4random_uniform(256)) / 256.0, blue: CGFloat(arc4random_uniform(256)) / 256.0, alpha: 1)
            scrollView.addSubview(label)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if (Int(targetContentOffset.memory.x) <= Int(divOfX*10)) {
            end = "\(Int(targetContentOffset.memory.x)/divOfX)"
        } else {
            end = "N/A"
        }
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        label.text = end
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        label.text = end
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        label.text = "-"
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        label.text = end
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        label.text = "-"
    }
}

