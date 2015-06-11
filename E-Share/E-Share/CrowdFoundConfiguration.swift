//
//  crowdFoundConfiguration.swift
//  E-Share
//
//  Created by Mr.Jim on 6/8/15.
//  Copyright (c) 2015 Jim. All rights reserved.
//

import Foundation

class CrowFoundConfiguration {
    var crowdFoundId: String?
    var bookCrowdFounder: String?
    var maximunCount: Int?
    var bookPrice: Float?
    
    var averagePrice: Float? {
        if bookPrice == nil || maximunCount == nil || maximunCount == 0 {
            return nil
        }
        return bookPrice! / Float(maximunCount!)
    }
}