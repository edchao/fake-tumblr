//
//  tabViewController.swift
//  fake-tumblr
//
//  Created by Ed Chao on 3/2/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class tabViewController: UIViewController {


    var fadeTransition: FadeTransition!

    
    // CLASS VARIABLES
    
    var contentView : UIView!
    var overlayContentView : UIView!
    var tabView : UIView!
    var btnHome : UIButton!
    var btnAccount : UIButton!
    var btnCompose : UIButton!
    var btnSearch: UIButton!
    var btnTrending : UIButton!
    var exploreView : UIImageView!

    
    
    // VIEW CONTROLLER INSTANCES
    
    var homeVC: homeViewController!
    var searchVC: searchViewController!
    var composeVC: composeViewController!
    var accountVC: accountViewController!
    var trendingVC: trendingViewController!
    var currentVC : UIViewController!

    var homeImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SETUP VC
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyboard.instantiateViewControllerWithIdentifier("homeStory") as homeViewController
        searchVC = storyboard.instantiateViewControllerWithIdentifier("searchStory") as searchViewController
        accountVC = storyboard.instantiateViewControllerWithIdentifier("accountStory") as accountViewController
        trendingVC = storyboard.instantiateViewControllerWithIdentifier("trendingStory") as trendingViewController
        

        // SETUP CONTENT VIEW
        
        contentView = UIView(frame: CGRect(x:0, y:0, width: 320, height: 524))
        contentView.backgroundColor = UIColor.grayColor()
        contentView.clipsToBounds = true
        view.addSubview(contentView)
        
        // SETUP TAB VIEW
        
        tabView = UIView(frame: CGRect(x: 0, y: 524, width: 320, height: 44))
        tabView.backgroundColor = UIColor(red: 51/255, green: 66/255, blue: 86/255, alpha: 1)
        view.addSubview(tabView)
        
        
        // SETUP TABS
        
        btnHome = UIButton(frame: CGRect(x:10, y:0, width: 44, height: 44))
        btnHome.setImage(UIImage(named:"home_icon"), forState: .Normal)
        btnHome.setImage(UIImage(named:"home_icon"), forState: .Highlighted)
        btnHome.setImage(UIImage(named:"home_selected_icon"), forState: .Selected)
        tabView.addSubview(btnHome)
        btnHome.addTarget(self,
            action: "homeBtnTapped:",
            forControlEvents: .TouchUpInside)

        btnSearch = UIButton(frame: CGRect(x:70, y:0, width: 44, height: 44))
        btnSearch.setImage(UIImage(named:"search_icon"), forState: .Normal)
        btnSearch.setImage(UIImage(named:"search_icon"), forState: .Highlighted)
        btnSearch.setImage(UIImage(named:"search_selected_icon"), forState: .Selected)
        tabView.addSubview(btnSearch)
        btnSearch.addTarget(self,
            action: "searchBtnTapped:",
            forControlEvents: .TouchUpInside)
        
        btnCompose = UIButton(frame: CGRect(x:125, y:0, width: 71, height: 44))
        btnCompose.setImage(UIImage(named:"compose_button"), forState: .Normal)
        btnCompose.setImage(UIImage(named:"compose_button"), forState: .Highlighted)
        btnCompose.setImage(UIImage(named:"compose_button"), forState: .Selected)
        tabView.addSubview(btnCompose)
        btnCompose.addTarget(self,
            action: "composeBtnTapped:",
            forControlEvents: .TouchUpInside)
        
        btnAccount = UIButton(frame: CGRect(x:200, y:0, width: 44, height: 44))
        btnAccount.setImage(UIImage(named:"account_icon"), forState: .Normal)
        btnAccount.setImage(UIImage(named:"account_icon"), forState: .Highlighted)
        btnAccount.setImage(UIImage(named:"account_selected_icon"), forState: .Selected)
        tabView.addSubview(btnAccount)
        btnAccount.addTarget(self,
            action: "accountBtnTapped:",
            forControlEvents: .TouchUpInside)
        
        btnTrending = UIButton(frame: CGRect(x:260, y:0, width: 44, height: 44))
        btnTrending.setImage(UIImage(named:"trending_icon"), forState: .Normal)
        btnTrending.setImage(UIImage(named:"trending_icon"), forState: .Highlighted)
        btnTrending.setImage(UIImage(named:"trending_selected_icon"), forState: .Selected)
        tabView.addSubview(btnTrending)
        btnTrending.addTarget(self,
            action: "trendingBtnTapped:",
            forControlEvents: .TouchUpInside)
        

        
        // SETUP EXPLORE HELPER BUBBLE
        
        exploreView = UIImageView(image: UIImage(named:"explore_popup"))
        exploreView.frame = CGRect(x: 0, y: 450, width: 185, height: 77.5)
        
        

        
        
        // INIT
        
        currentVC = homeVC
        homeBtnTapped(self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // TAB BUTTON EVENTS
    
    func homeBtnTapped(sender:AnyObject){
        animateExplore()
        
        removeChildView(currentVC)
        addChildViewController(homeVC)
        homeVC.view.frame = contentView.frame
        contentView.addSubview(homeVC.view)
        homeVC.didMoveToParentViewController(self)
        currentVC = homeVC
        
        btnHome.selected = true
        btnSearch.selected = false
        btnCompose.selected = false
        btnAccount.selected = false
        btnTrending.selected = false
    }
    
    func searchBtnTapped(sender:UIButton){
        removeExplore()
        
        removeChildView(currentVC)
        addChildViewController(searchVC)
        searchVC.view.frame = contentView.frame
        contentView.addSubview(searchVC.view)
        searchVC.didMoveToParentViewController(self)
        currentVC = searchVC
        
        btnHome.selected = false
        btnSearch.selected = true
        btnCompose.selected = false
        btnAccount.selected = false
        btnTrending.selected = false

    }
    
    func composeBtnTapped(sender:UIButton){  
        
        performSegueWithIdentifier("composeSegue", sender: self)
        
        btnHome.selected = false
        btnSearch.selected = false
        btnCompose.selected = true
        btnAccount.selected = false
        btnTrending.selected = false
    }
    
    func accountBtnTapped(sender:UIButton){
        removeChildView(currentVC)
        addChildViewController(accountVC)
        accountVC.view.frame = contentView.frame
        contentView.addSubview(accountVC.view)
        accountVC.didMoveToParentViewController(self)
        currentVC = accountVC
        
        btnHome.selected = false
        btnSearch.selected = false
        btnCompose.selected = false
        btnAccount.selected = true
        btnTrending.selected = false
    }
    
    func trendingBtnTapped(sender:UIButton){
        removeChildView(currentVC)
        addChildViewController(trendingVC)
        trendingVC.view.frame = contentView.frame
        contentView.addSubview(trendingVC.view)
        trendingVC.didMoveToParentViewController(self)
        currentVC = trendingVC
        
        btnHome.selected = false
        btnSearch.selected = false
        btnCompose.selected = false
        btnAccount.selected = false
        btnTrending.selected = true
        
    }
    
    func removeChildView(content:UIViewController){
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    // EXPLORE ANIMATION
    
    func animateExplore(){
        view.addSubview(exploreView)
    
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.exploreView.alpha = 1
            self.exploreView.center.y = 484
        }) { (Bool) -> Void in
            UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                
                self.exploreView.center.y = 494
                
                }) { (Bool) -> Void in
                    //
            }
        }
        


    }
    
    func removeExplore(){
        
        UIView.animateWithDuration(0.5, delay: 0, options:UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            
            self.exploreView.alpha = 0
            
            }) { (Bool) -> Void in
                self.exploreView.removeFromSuperview()
        }

    }
    

    
    // PREPARE SEGUE
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationViewController = segue.destinationViewController as composeViewController
        
        fadeTransition = FadeTransition()
        fadeTransition.duration = 0.5
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    



}
