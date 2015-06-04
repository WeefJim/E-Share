//
//  LoginViewController.swift
//  E-Share
//
//  Created by Mr.Jim on 6/3/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景颜色
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        // 隐藏状态栏
        UIApplication.sharedApplication().statusBarHidden = true
        
        
        // 默认用户头像
        let defaultAvatar = UIImageView(image: UIImage(named: "login_avatar_default")!)
        //defaultAvatar.frame.size = CGSizeMake(128, 128)
        defaultAvatar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(defaultAvatar)
        
        // 登录框背景
        let textFieldBackView = LoginBackView()
        textFieldBackView.backgroundColor = UIColor.clearColor()
        textFieldBackView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(textFieldBackView)
        
        
        // 账号icon
        let usernameIcon = UIImageView(image: UIImage(named: "login_username")!)
        usernameIcon.setTranslatesAutoresizingMaskIntoConstraints(false)
        textFieldBackView.addSubview(usernameIcon)
        
        // 账号textField
        usernameTextField = UITextField()
        usernameTextField.placeholder = "请输入账号"
        usernameTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        textFieldBackView.addSubview(usernameTextField)
        
        
        // 密码icon
        let passwordIcon = UIImageView(image: UIImage(named: "login_password")!)
        passwordIcon.setTranslatesAutoresizingMaskIntoConstraints(false)
        textFieldBackView.addSubview(passwordIcon)
        
        // 密码textField
        passwordTextField = UITextField()
        passwordTextField.secureTextEntry = true
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        textFieldBackView.addSubview(passwordTextField)
        
        
        // 登录按钮
        let loginButton = UIButton.buttonWithType(.System) as! UIButton
        loginButton.setTitle("登录", forState: .Normal)
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        loginButton.layer.cornerRadius = 5
        loginButton.backgroundColor = UIColor.loginButtonColor()
        loginButton.enabled = false
        loginButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(loginButton)
        
        
        // 头像约束
        self.view.addConstraint(NSLayoutConstraint(item: defaultAvatar, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: defaultAvatar, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Bottom, multiplier: 1, constant: 20))
        
        // 登录框
        self.view.addConstraint(NSLayoutConstraint(item: textFieldBackView, attribute: .Top, relatedBy: .Equal, toItem: defaultAvatar, attribute: .Bottom, multiplier: 1, constant: 20))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[textFieldBackView]-|", options: nil, metrics: nil, views: ["textFieldBackView": textFieldBackView]))
        textFieldBackView.addConstraint(NSLayoutConstraint(item: textFieldBackView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100))
        
        // 登录按钮
        self.view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Top, relatedBy: .Equal, toItem: textFieldBackView, attribute: .Bottom, multiplier: 1, constant: 40))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[loginButton]-|", options: nil, metrics: nil, views: ["loginButton": loginButton]))
        loginButton.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44))
        
        
        // 账号icon, 账号textfield, 密码icon和textfield
        textFieldBackView.addConstraint(NSLayoutConstraint(item: usernameIcon, attribute: .CenterY, relatedBy: .Equal, toItem: textFieldBackView, attribute: .CenterY, multiplier: 1/2, constant: 0))
        textFieldBackView.addConstraint(NSLayoutConstraint(item: passwordIcon, attribute: .CenterY, relatedBy: .Equal, toItem: textFieldBackView, attribute: .CenterY, multiplier: 3/2, constant: 0))
     
        textFieldBackView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[usernameTextField]-[passwordTextField]-|", options: nil, metrics: nil, views: ["usernameTextField": usernameTextField, "passwordTextField": passwordTextField]))
        
        textFieldBackView.addConstraint(NSLayoutConstraint(item: usernameTextField, attribute: .Height, relatedBy: .Equal, toItem: passwordTextField, attribute: .Height, multiplier: 1, constant: 0))
        
        textFieldBackView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[usernameIcon(16)]-[usernameTextField]-|", options: nil, metrics: nil, views: ["usernameIcon": usernameIcon, "usernameTextField": usernameTextField]))
        textFieldBackView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[passwordIcon(16)]-[passwordTextField]-|", options: nil, metrics: nil, views: ["passwordIcon": passwordIcon, "passwordTextField": passwordTextField]))
        
    }

    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touchView in self.view.subviews {
            if !(touchView.isKindOfClass(UITextField.self) && touchView.isFirstResponder()) {
                usernameTextField.resignFirstResponder()
                passwordTextField.resignFirstResponder()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
