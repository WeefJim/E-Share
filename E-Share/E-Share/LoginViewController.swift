//
//  LoginViewController.swift
//  E-Share
//
//  Created by Mr.Jim on 6/3/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // 用户名和密码
    var username: String? { return usernameTextField.text }
    var password: String? { return passwordTextField.text }
    
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    
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
        usernameTextField.clearButtonMode = .WhileEditing
        usernameTextField.placeholder = "请输入账号"
        usernameTextField.addTarget(self, action: "textFieldDidChange", forControlEvents: .EditingChanged)
        usernameTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        textFieldBackView.addSubview(usernameTextField)
        
        
        // 密码icon
        let passwordIcon = UIImageView(image: UIImage(named: "login_password")!)
        passwordIcon.setTranslatesAutoresizingMaskIntoConstraints(false)
        textFieldBackView.addSubview(passwordIcon)
        
        
        
        // 密码textField
        passwordTextField = UITextField()
        passwordTextField.secureTextEntry = true
        passwordTextField.clearButtonMode = .WhileEditing
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.addTarget(self, action: "textFieldDidChange", forControlEvents: .EditingChanged)
        passwordTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        textFieldBackView.addSubview(passwordTextField)
        
        
        // 登录按钮
        loginButton = UIButton.buttonWithType(.System) as! UIButton
        loginButton.setTitle("登录", forState: .Normal)
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginButton.setTitleColor(UIColor.lightTextColor(), forState: .Disabled)
        loginButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        loginButton.layer.cornerRadius = 5
        loginButton.backgroundColor = UIColor.loginButtonColor()
        loginButton.enabled = false
        loginButton.addTarget(self, action: "loginButtonDidTap", forControlEvents: .TouchUpInside)
        loginButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(loginButton)
        
        
        // 用户注册label
        let registerLabel = UILabel()
        registerLabel.text = "用户注册"
        registerLabel.textColor = UIColor.loginButtonColor()
        registerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "registerLabelDidTap"))
        registerLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        registerLabel.userInteractionEnabled = true
        self.view.addSubview(registerLabel)
        
        // 中间分割线
        let splitLine = UIView()
        splitLine.backgroundColor = UIColor.loginButtonColor()
        splitLine.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(splitLine)
        
        // 忘记密码label
        let forgetLabel = UILabel()
        forgetLabel.text = "忘记密码"
        forgetLabel.textColor = UIColor.loginButtonColor()
        forgetLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "forgetLabelDidTap"))
        forgetLabel.userInteractionEnabled = true
        forgetLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(forgetLabel)
        
        
        
        
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
        
        
        // 用户注册，splitLine, 忘记密码
        self.view.addConstraint(NSLayoutConstraint(item: splitLine, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: splitLine, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: -20))
        self.view.addConstraint(NSLayoutConstraint(item: splitLine, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 1))
        self.view.addConstraint(NSLayoutConstraint(item: splitLine, attribute: .Height, relatedBy: .Equal, toItem: registerLabel, attribute: .Height, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: splitLine, attribute: .Height, relatedBy: .Equal, toItem: forgetLabel, attribute: .Height, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: splitLine, attribute: .Bottom, relatedBy: .Equal, toItem: registerLabel, attribute: .Bottom, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: splitLine, attribute: .Bottom, relatedBy: .Equal, toItem: forgetLabel, attribute: .Bottom, multiplier: 1, constant: 0))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[registerLabel]-[splitLine]-[forgetLabel]", options: nil, metrics: nil, views: ["registerLabel": registerLabel, "splitLine": splitLine, "forgetLabel": forgetLabel]))
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touchView in self.view.subviews {
            if !(touchView.isKindOfClass(UITextField.self) && touchView.isFirstResponder()) {
                usernameTextField.resignFirstResponder()
                passwordTextField.resignFirstResponder()
            }
        }
    }
    
    
    // MARK: - TextField Event
    func textFieldDidChange(){
        if username == "" || password == "" {
            loginButton.enabled = false
        }else{
            loginButton.enabled = true
        }
    }
    
    
    // MARK: - GestureRecognizer Event
    
    func registerLabelDidTap(){
        println("register label did tap")
    }
    
    func forgetLabelDidTap(){
        println("forget label did tap")
    }
    
    // MARK: - Button Event
    func loginButtonDidTap(){
        if let window = self.view.window {
            window.rootViewController = MainTabBarController()
        }
    }
    
   
    
    
    
    
    
    
}
