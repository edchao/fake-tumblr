//
//  composeViewController.swift
//  fake-tumblr
//
//  Created by Ed Chao on 3/2/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//
// Notes: I added the UIViewControllerTransitioningDelegate and the init

import UIKit

class composeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    // CLASS VARIABLES
    
    var isPresenting: Bool = true

    var overlayView : UIView!
    var bbVideoImageView : UIImageView!
    var bbChatImageView : UIImageView!
    var bbLinkImageView : UIImageView!
    var bbPhotoImageView : UIImageView!
    var bbQuoteImageView : UIImageView!
    var bbTextImageView : UIImageView!
    var btnNevermind : UIButton!
    
    var parentReference : UIViewController!
    var superview: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SETUP VIEW
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        // SETUP OVERLAY
        
        overlayView = UIView(frame: view.frame)
        overlayView.backgroundColor = UIColor(red: 51/255, green: 66/255, blue: 86/255, alpha: 0.99)
        overlayView.alpha = 0
        view.addSubview(overlayView)
        
        // SETUP BUBBLES
        
        bbTextImageView = UIImageView(image: UIImage(named:"text_icon"))
        bbTextImageView.frame = CGRect(x: 30, y: 568, width: 75, height: 96)
        view.addSubview(bbTextImageView)
        
        bbPhotoImageView = UIImageView(image: UIImage(named:"photo_icon"))
        bbPhotoImageView.frame = CGRect(x: 123, y: 568, width: 75, height: 96)
        view.addSubview(bbPhotoImageView)

        bbQuoteImageView = UIImageView(image: UIImage(named:"quote_icon"))
        bbQuoteImageView.frame = CGRect(x: 215, y: 568, width: 75, height: 96)
        view.addSubview(bbQuoteImageView)
        
        bbLinkImageView = UIImageView(image: UIImage(named:"link_icon"))
        bbLinkImageView.frame = CGRect(x: 30, y: 568, width: 75, height: 96)
        view.addSubview(bbLinkImageView)
        
        bbChatImageView = UIImageView(image: UIImage(named:"chat_icon"))
        bbChatImageView.frame = CGRect(x: 123, y: 568, width: 75, height: 96)
        view.addSubview(bbChatImageView)

        bbVideoImageView = UIImageView(image: UIImage(named:"video_icon"))
        bbVideoImageView.frame = CGRect(x: 215, y: 568, width: 75, height: 96)
        view.addSubview(bbVideoImageView)
        
        // SETUP BUTTON
        
        btnNevermind = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        btnNevermind.frame = CGRect(x: 0, y: 568, width: 320, height: 53)
        btnNevermind.setImage(UIImage(named:"nevermind"), forState: .Normal)
        btnNevermind.setImage(UIImage(named:"nevermind"), forState: .Highlighted)

        btnNevermind.addTarget(self,
            action: "btnNevermindTapped:",
            forControlEvents: .TouchUpInside)
        view.addSubview(btnNevermind)
        
        
    }
    
    // APPEARANCE FUNCTIONS
    
    override func viewWillAppear(animated: Bool) {
        println("compose view will appear")
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.btnNevermind.frame = CGRect(x: 0, y: 515, width: 320, height: 53)
            }, completion: { (Bool) -> Void in
                //
        })
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.overlayView.alpha = 0.9
            
            }) { (Bool) -> Void in
                
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                    self.bbTextImageView.center.y = 150
                    }, completion: { (Bool) -> Void in
                        //
                })
                
                UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                    self.bbPhotoImageView.center.y = 150
                    }, completion: { (Bool) -> Void in
                        //
                })
                
                UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                    self.bbQuoteImageView.center.y = 150
                    }, completion: { (Bool) -> Void in
                        //
                })
                
                UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                    self.bbLinkImageView.center.y = 280
                    }, completion: { (Bool) -> Void in
                        //
                })
                
                UIView.animateWithDuration(0.5, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                    self.bbChatImageView.center.y = 280
                    }, completion: { (Bool) -> Void in
                        //
                })
                
                UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
                    self.bbVideoImageView.center.y = 280
                    }, completion: { (Bool) -> Void in
                        //
                })
                
        }

        
    }
    
    override func viewDidAppear(animated: Bool) {
        println("compose view did appear")
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        println("compose view will disappear")
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.btnNevermind.frame = CGRect(x: 0, y: 568, width: 320, height: 53)
            }, completion: { (Bool) -> Void in
                //
        })
        
        UIView.animateWithDuration(0.5, delay: 0.05, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.bbTextImageView.center.y = -100
            }, completion: { (Bool) -> Void in
                //
        })
        
        UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.bbPhotoImageView.center.y = -100
            }, completion: { (Bool) -> Void in
                //
        })
        
        UIView.animateWithDuration(0.5, delay: 0.15, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.bbQuoteImageView.center.y = -100
            }, completion: { (Bool) -> Void in
                //
        })
        
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.bbLinkImageView.center.y = -100
            }, completion: { (Bool) -> Void in
                //
        })
        
        UIView.animateWithDuration(0.5, delay: 0.25, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.bbChatImageView.center.y = -100
            }, completion: { (Bool) -> Void in
                //
        })
        
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            self.bbVideoImageView.center.y = -100
            
            }, completion: { (Bool) -> Void in
                //
        })

        
    }
    
    override func viewDidDisappear(animated: Bool) {
        println("compose view did disappear")
    }
    
    // MEMORY WARNING
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // EVENT
    
    func btnNevermindTapped(sender:UIButton){
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    


}
