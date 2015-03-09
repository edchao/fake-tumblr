//
//  loginViewController.swift
//  fake-tumblr
//
//  Created by Ed Chao on 3/8/15.
//  Copyright (c) 2015 edchao. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    var loginImageView : UIImageView!
    var overlayView : UIView!
    var btnCancel : UIButton!
    var loginTextField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SETUP VIEW
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        // SETUP OVERLAY
        
        overlayView = UIView(frame: view.frame)
        overlayView.backgroundColor = UIColor(red: 51/255, green: 66/255, blue: 86/255, alpha: 0.9)
        view.addSubview(overlayView)
        
        // SETUP LOGIN FORM
        
        loginImageView = UIImageView(image: UIImage(named:"login_form"))
        loginImageView.frame = CGRect(x: 10, y: 126, width: 305, height: 132)
        view.addSubview(loginImageView)
        
        btnCancel = UIButton(frame: CGRect(x: 10, y: 215, width: 154, height: 40))
        btnCancel.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 0)
        btnCancel.addTarget(self, action: "btnCancelTapped:",forControlEvents: .TouchUpInside)
        view.addSubview(btnCancel)
        
        loginTextField = UITextField(frame: CGRect(x: 14, y: 3, width: 200.00, height: 40.00))
        loginTextField.placeholder = "some string"
        loginTextField.backgroundColor = UIColor.whiteColor()
        loginTextField.becomeFirstResponder()
        loginImageView.addSubview(loginTextField)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnCancelTapped(sender:UIButton!){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    



}
