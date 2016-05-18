//
//  HomeVM.swift
//  MVVM
//
//  Created by alberto.scampini on 17/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

//  This is the ViewModel of the HomeV (View - ViewController)
//  it use Dynamic classes as binding, to get notifyed when a value
//  of one of that variables (classes) changes

import Foundation

class HomeVM: NSObject, HomeM {

    var title: Dynamic<String>!
    var dateFormat: Dynamic<String>!
    
    init(text : String, dateFormat : String) {
        super.init()
        self.title = Dynamic(text)
        self.dateFormat = Dynamic(dateFormat)
        self.startTimer()
        
        self.dateFormat.bindAndFire {
            [unowned self] in
            _ = $0
            self.setDate()
        }
    }
    
    internal func startTimer () {
        NSTimer.scheduledTimerWithTimeInterval(
            0.1667, //60 fps
            target: self,
            selector: #selector(self.setDate),
            userInfo: nil,
            repeats: true
        )
    }
    
    internal func setDate() {
        self.title.value = self.getCurrentDateString(self.dateFormat.value)
    }
}
