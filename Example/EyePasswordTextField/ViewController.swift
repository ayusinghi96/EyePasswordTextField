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
/// The sample view controller.
///
class ViewController: UIViewController
{
    /// A user name text field.
    @IBOutlet private var userNameTextField: UITextField!
    /// The custom password field.
    @IBOutlet private var passwordTextField: EyePasswordTextField!
    /// The login button.
    @IBOutlet private var loginButton: UIButton!
}


// MARK: - Overrides
extension ViewController
{
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


// MARK: - Action
extension ViewController
{
    @IBAction private func onLoginTapped(_ sender: UIButton)
    {
        // Implementation needed.
    }
}


// MARK: - EyePasswordFieldDelegate Confromance
extension ViewController: EyePasswordFieldDelegate
{
    func didTapEyeButton(forTextfield textField: UITextField)
    {
        // If some implementation required
    }
}
