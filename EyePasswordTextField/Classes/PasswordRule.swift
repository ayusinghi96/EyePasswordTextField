//
//  PasswordRule.swift
//  EyePasswordTextField
//
//  Created by Ayush Singhi on 09/05/21.
//

import Foundation


///
/// The password rules.
///
public struct PasswordRule
{
    private let minLength: Int
    private let maxLength: Int
    private let hasNumbers: Bool
    private let hasUppercase: Bool
    private let hasSpecialCharacters: Bool
    private let allowedCharacters: [String]

    public init(
        minLength: Int = 8,
        maxLength: Int = 255,
        hasNumbers: Bool = true,
        hasUppercase: Bool = true,
        hasSpecialCharacters: Bool = true,
        allowedCharacters: [String] = ["@", "_", "-"])
    {
        self.minLength = minLength
        self.maxLength = maxLength
        self.hasNumbers = hasNumbers
        self.hasUppercase = hasUppercase
        self.hasSpecialCharacters = hasSpecialCharacters
        self.allowedCharacters = allowedCharacters
    }

    static let `default` = Self()
}


// MARK: - Convenience props
extension PasswordRule
{
    ///
    /// Check if the given password is valid.
    ///
    /// - Parameters:
    ///   - password: The password text.
    ///
    /// - Returns: If the password is valid.
    ///
    func validatePassword(password: String) -> Bool
    {
        var passwordRegEx = "^(?=.*[a-z])"
        if self.hasUppercase { passwordRegEx = passwordRegEx + "(?=.*[A-Z])" }
        if self.hasNumbers { passwordRegEx = passwordRegEx + "(?=.*[0-9])" }
        if self.hasSpecialCharacters { passwordRegEx = passwordRegEx + "(?=.*[\(self.allowedCharacters.joined())])" }
        passwordRegEx = passwordRegEx + ".{\(self.minLength),\(self.maxLength)}$"

        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let isCorrect = passwordTest.evaluate(with: password)

        return isCorrect
    }
}
