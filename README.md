# EyePasswordTextField

[![Version](https://img.shields.io/cocoapods/v/EyePasswordTextField.svg?style=flat)](https://cocoapods.org/pods/EyePasswordTextField)
[![License](https://img.shields.io/cocoapods/l/EyePasswordTextField.svg?style=flat)](https://cocoapods.org/pods/EyePasswordTextField)
[![Platform](https://img.shields.io/cocoapods/p/EyePasswordTextField.svg?style=flat)](https://cocoapods.org/pods/EyePasswordTextField)

An elegant and simple way to add a dedicated `UITextField` for `Password` input fields. `EyePasswordTextField` applies custom features that are intutive and core to a password type of textField.

## Requirements

Requirements to use this library are.

* Minimum deployment target of App should be `iOS 11.0` or above.
* Supported Swift version should be `Swift 5`.

## Installation

EyePasswordTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EyePasswordTextField'
```

## Features

Features provided by `EyePasswordTextField` are:

* Toggle the `default` eye button to show or hide the password.
* Add your custom icon to toggle button. (Recommended icon size - 25px X 25px)

  ```Swift
  let passwordTextField = EyePasswordTextField()
  
  passwordTextField.showPasswordIcon = // Custom UIImage to be visible when password is not visible.
  passwordTextField.hidePasswordIcon = // Custom UIImage to be visible when password is visible.
  ```
* Customize the tint of your toogle icon button.

  ```Swift
  let passwordTextField = EyePasswordTextField()
  
  passwordTextField.tintColor =  // Your custom UIColor.
  ```
* `EyePasswordTextField` provides custom delegation protocol `EyePasswordFieldDelegate`.
* Add your custom password creation rules by adding them to the `PasswordRule` stuct.

  ```Swift
  let passwordTextField = EyePasswordTextField()
  
  passwordTextField.passwordRule = PasswordRule(
      minLength: 8, // Minimum password length
      maxLength: 20, // Maximum password length
      hasNumbers: true, // If password should have numbers.
      hasUppercase: false, // If password should have upper case letters.
      hasSpecialCharacters: true, // If password should have a special character.
      allowedCharacters: [String] = ["@", "_", "-"] // A list of allowed special characters.
  )
  ```
* Validates and informs if the entered password is `valid`.
  
  ```Swift
  let passwordTextField = EyePasswordTextField()
  
  passwordTextField.isPasswordValid
  ```

## Example

To see and run the example project, clone the repo, and run `pod install` from the Example directory first.

## Contribute

* Fork repository. ✌️
* Add your feature 😎 or fix a 🐛.
* Raise a pull request. 🤓

## Author

Ayush Singhi, ayusinghi96@gmail.com

## License

EyePasswordTextField is available under the MIT license. See the LICENSE file for more info.
