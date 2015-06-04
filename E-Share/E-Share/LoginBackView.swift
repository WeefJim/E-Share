//
//  LoginBackView.swift
//  E-Share
//
//  Created by Mr.Jim on 6/4/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import UIKit

class LoginBackView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let lineWidth: CGFloat = 2
        
        let width = self.bounds.width - 2*lineWidth
        let height = self.bounds.height - 2*lineWidth
        let roundedRect = CGRectMake(lineWidth, lineWidth, width, height)
        let roundedRectPath = UIBezierPath(roundedRect: roundedRect, cornerRadius: 5)
        roundedRectPath.lineWidth = lineWidth
        UIColor.whiteColor().setFill()
        roundedRectPath.fill()
        UIColor.lightLineColor().setStroke()
        roundedRectPath.stroke()

        
        let middleLinePath = UIBezierPath()
        middleLinePath.lineWidth = lineWidth
        middleLinePath.moveToPoint(CGPointMake(lineWidth, 1/2*(height+lineWidth)))
        middleLinePath.addLineToPoint(CGPointMake(width+lineWidth, 1/2*(height+lineWidth)))
        middleLinePath.stroke()
    }


}
