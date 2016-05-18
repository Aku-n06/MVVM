//
//  HomeM.swift
//  MVVM
//
//  Created by alberto.scampini on 17/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

//  This is an example of protocol extension
//  sometimes there is no need to create a class, in swift
//  you can create a protocol, declare the functions and than
//  implement the functions in an extension of the protocol

import Foundation

protocol HomeM {
    
    func getCurrentDateString(format : String) -> String
    
}

extension HomeM {
    
    func getCurrentDateString(format : String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(NSDate())
    }
    
}