//
//  homeViewController.swift
//  fake-tumblr
//
//  Created by Ed Chao on 3/2/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    
    var fadeTransition: FadeTransition!
    
    // CLASS VARIABLES
    
    var homeImageView : UIImageView!
    var homeScrollView : UIScrollView!
    var homeSpinner : UIImageView!
    var homeOverlay : UIImageView!
    var homeTitle : UIImageView!
    var btnLogin : UIButton!
    
    
    // VIEW CONTROLLER INSTANCES
    
    var loginVC: loginViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SETUP VC
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginVC = storyboard.instantiateViewControllerWithIdentifier("loginStory") as loginViewController

        
        // SETUP MAIN VIEW
        
        view.backgroundColor = UIColor(red: 51/255, green: 70/255, blue: 93/255, alpha: 1)
        
        // SETUP SCROLL VIEW
        
        homeImageView = UIImageView(image: UIImage(named:"home"))
        homeImageView.userInteractionEnabled = true
        homeScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 320, height: 530))
        homeScrollView.addSubview(self.homeImageView)
        homeScrollView.contentSize = self.homeImageView.frame.size
        view.addSubview(self.homeScrollView)
        
        // SETUP IMAGE VIEWS

        homeSpinner = UIImageView(image:UIImage(named:"home_spinner"))
        homeSpinner.frame = CGRect(x: 30, y: 164, width: 146, height: 146)
        homeSpinner.center.x = 160
        homeScrollView.addSubview(homeSpinner)
        
        homeOverlay = UIImageView(image:UIImage(named:"home_overlay"))
        homeOverlay.frame = CGRect(x: 5, y: 250, width: 320, height: 100)
        homeOverlay.center.x = 160
        homeScrollView.addSubview(homeOverlay)
        
        // SETUP TOP HEADER
        
        homeTitle = UIImageView(image: UIImage(named:"home_header"))
        homeTitle.frame = CGRect(x: 0, y: 0, width: 320, height: 64)
        view.addSubview(homeTitle)
        
        // SETUP LOGIN BUTTOn
        
        btnLogin = UIButton(frame: CGRect(x:250, y:30, width: 60, height: 25))
        btnLogin.setTitle("Log In", forState: .Normal)
        btnLogin.setTitleColor(UIColor(red: 133/255, green: 141/255, blue: 152/255, alpha: 1), forState: .Normal)
        btnLogin.addTarget(self,
            action: "btnLoginTapped:",
            forControlEvents: .TouchUpInside)
        view.addSubview(btnLogin)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    override func viewWillAppear(animated: Bool) {

    }
    
    
    func btnLoginTapped(sender:UIButton!){
        performSegueWithIdentifier("loginSegue", sender: self)
    }
    
    // PREPARE SEGUE
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationViewController = segue.destinationViewController as loginViewController
        
        fadeTransition = FadeTransition()
        fadeTransition.duration = 0.2
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    

    

}
