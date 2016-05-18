//
//  HomeVC.swift
//  MVVM
//
//  Created by alberto.scampini on 17/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

//  This should be the View in MVVM pattern (but it's a viewController because
//  of ios app architectures) it use the HomeVM with binding of his Dynamic
//  variables to react whenever the value of thet variables changes

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var textField : UITextField!
    
    var viewModel: HomeVM! {
        didSet {
            viewModel.title.bindAndFire {
                [unowned self] in
                self.titleLabel.text = $0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeVM(text: "", dateFormat: "")
        self.textField.addTarget(
            self,
            action: #selector(self.textFieldDidChange(_:)),
            forControlEvents: UIControlEvents.EditingChanged
        )
        self.textField.becomeFirstResponder()
    }
    
    //MARK: user interaction
    
    func textFieldDidChange(textField: UITextField) {
        viewModel.dateFormat.value = textField.text!
    }
}
