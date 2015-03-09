//
//  trendingViewController.swift
//  fake-tumblr
//
//  Created by Ed Chao on 3/2/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class trendingViewController: UIViewController {

    var trendingImageView : UIImageView!
    var trendingScrollView : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // SETUP MAIN VIEW
        
        view.backgroundColor = UIColor(red: 51/255, green: 70/255, blue: 93/255, alpha: 1)
        
        
        // SETUP SCROLL VIEW
        
        trendingImageView = UIImageView(image: UIImage(named:"trending_feed"))
        trendingImageView.userInteractionEnabled = true
        trendingScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 320, height: 530))
        trendingScrollView.addSubview(self.trendingImageView)
        trendingScrollView.contentSize = self.trendingImageView.frame.size
        view.addSubview(self.trendingScrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
