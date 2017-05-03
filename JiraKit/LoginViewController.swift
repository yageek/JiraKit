//
//  LoginViewController.swift
//  JiraKit
//
//  Created by Yannick Heinrich on 06.09.16.
//  Copyright © 2016 yageek. All rights reserved.
//

import UIKit
import ProcedureKit

class LoginViewController: UIViewController {

    let queue = ProcedureQueue()

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.modalPresentationStyle = .formSheet
    }

    @IBAction func loginTriggered(_ sender: AnyObject) {

    }


}
