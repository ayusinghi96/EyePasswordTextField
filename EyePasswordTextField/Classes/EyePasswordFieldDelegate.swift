//
//  EyePasswordFieldDelegate.swift
//  EyePasswordTextField
//
//  Created by Ayush Singhi on 09/05/21.
//

import Foundation


///
/// The eye password text field delegates.
///
@objc public protocol EyePasswordFieldDelegate: UITextFieldDelegate
{
    ///
    /// When the eye button is tapped on this text field.
    ///
    /// - Parameters:
    ///   - textField: This text field.
    ///
    @objc func didTapEyeButton(forTextfield textField: UITextField)
}

