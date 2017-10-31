//
//  ViewController.swift
//  Bluepill-Sample
//
//  Created by Yusuke on 2017/10/31.
//  Copyright © 2017 Yusuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }

    // MARK: - Action
    
    @IBAction func tapRegister(_ sender: Any) {
        
        guard
            let id = idText.text,
            let mail = mailText.text,
            let password = passwordText.text else { return }
        
        // ID
        if id.isEmpty {
            messageLabel.text = "ID is required"
            return
        }
        
        // Mail
        if validateMail(mail) == false {
            messageLabel.text = "Mail is invalid"
            return
        }
        
        // Password
        if password.count < 8 {
            messageLabel.text = "Password must be at least 8 characters long"
            return
        }
        
        messageLabel.text = "Register success!!"
    }
    
    private func validateMail(_ text: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: text)
    }
}
