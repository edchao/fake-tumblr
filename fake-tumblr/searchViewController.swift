//
//  searchViewController.swift
//  fake-tumblr
//
//  Created by Ed Chao on 3/2/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class searchViewController: UIViewController {

    var searchImageView : UIImageView!
    var searchScrollView : UIScrollView!
    var spinnerWrapper: UIView!
    var frameOne : UIImageView!
    var frameTwo : UIImageView!
    var frameThree : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // SETUP MAIN VIEW
        
        view.backgroundColor = UIColor(red: 51/255, green: 70/255, blue: 93/255, alpha: 1)
        
        // SETUP SCROLL VIEW
        
        searchImageView = UIImageView(image: UIImage(named:"search_feed"))
        searchImageView.userInteractionEnabled = true
        searchImageView.frame = CGRect(x: 0, y: 0, width: 320, height: 530)
        view.addSubview(self.searchImageView)

        // SETUP SPINNER
        
        
        frameOne = UIImageView(image: UIImage(named:"loading-1"))
        frameTwo = UIImageView(image: UIImage(named:"loading-2"))
        frameThree = UIImageView(image: UIImage(named:"loading-3"))
        frameOne.frame = CGRect(x: 0, y: 0, width: 61, height: 19)
        frameTwo.frame = CGRect(x: 0, y: 0, width: 61, height: 19)
        frameThree.frame = CGRect(x: 0, y: 0, width: 61, height: 19)
        frameOne.alpha = 1
        frameTwo.alpha = 0
        frameThree.alpha = 0
        
        spinnerWrapper = UIView(frame: CGRect(x: 100, y: 350, width: 61, height: 19))
        spinnerWrapper.center = CGPoint(x: 320/2, y: 568/2)
        spinnerWrapper.addSubview(frameOne)
        spinnerWrapper.addSubview(frameTwo)
        spinnerWrapper.addSubview(frameThree)
        
        view.addSubview(spinnerWrapper)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.hideView()
        self.showSpinner()
        self.delay(2.0){
            self.showView()
            self.hideSpinner()
        }
    }
    
    func hideView() {
        self.searchImageView.alpha = 0
    }
    
    func showView(){
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.searchImageView.alpha = 1
        })
        
    }
    
    // SPINNER
    
    func showSpinner(){
        let spinnerDuration = 1.5
        let spinnerDelay = 0.0
        let spinnerOptions = UIViewKeyframeAnimationOptions.CalculationModeLinear | UIViewKeyframeAnimationOptions.Repeat
        
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.spinnerWrapper.alpha = 1
        })
        
        UIView.animateKeyframesWithDuration(spinnerDuration, delay: spinnerDelay, options: spinnerOptions, animations: { () -> Void in
            UIView.addKeyframeWithRelativeStartTime(0/3, relativeDuration: 1/3, animations: { () -> Void in
                self.frameOne.alpha = 1
                self.frameTwo.alpha = 0
                self.frameThree.alpha = 0
            })
            UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: { () -> Void in
                self.frameOne.alpha = 0
                self.frameTwo.alpha = 1
                self.frameThree.alpha = 0
            })
            UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: { () -> Void in
                self.frameOne.alpha = 0
                self.frameTwo.alpha = 0
                self.frameThree.alpha = 1
            })
            }) { (Bool) -> Void in
                //
        }
        
        
    }
    
    func hideSpinner(){
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.spinnerWrapper.alpha = 0
        })
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(),closure)
    }
    


}
