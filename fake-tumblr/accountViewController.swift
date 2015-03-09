//
//  accountViewController.swift
//  fake-tumblr
//
//  Created by Ed Chao on 3/2/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class accountViewController: UIViewController {

    // CLASS VARIABLES
    
    var accountImageView : UIImageView!
    var accountScrollView : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // SETUP MAIN VIEW
        
        view.backgroundColor = UIColor(red: 51/255, green: 70/255, blue: 93/255, alpha: 1)
        
        
        // SETUP SCROLL VIEW
        
        accountImageView = UIImageView(image: UIImage(named:"account"))
        accountImageView.userInteractionEnabled = true
        accountScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 320, height: 530))
        accountScrollView.addSubview(self.accountImageView)
        accountScrollView.contentSize = CGSize(width: 320, height: 540)
        view.addSubview(self.accountScrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
