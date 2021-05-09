//
//  ViewController.swift
//  EyePasswordTextField
//
//  Created by ayusinghi96 on 05/09/2021.
//  Copyright (c) 2021 ayusinghi96. All rights reserved.
//

import UIKit
import EyePasswordTextField

///
///
///
class ViewController: UIViewController
{
    ///
    @IBOutlet private var userNameTextField: UITextField!
    /// The custom password field.
    @IBOutlet private var passwordTextField: EyePasswordTextField!
    /// The login button.
    @IBOutlet private var loginButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.passwordTextField.fieldDelegate = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - EyePasswordFieldDelegate Confromance
extension ViewController: EyePasswordFieldDelegate
{
    func didSelectEye()
    {
        // If some implementation required
    }
}
