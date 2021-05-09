//
//  EyePasswordTextField.swift
//  EyePasswordTextField
//
//  Created by Ayush Singhi on 09/05/21.
//


import UIKit


///
///
///
public protocol EyePasswordFieldDelegate: UITextFieldDelegate
{
    func didSelectEye()
}


///
/// The Password Eye button
///
open class EyePasswordTextField: UITextField
{
    private enum Constants
    {
        static let rightOffset = 5
        static let sideLength = 25
    }

    public weak var fieldDelegate: EyePasswordFieldDelegate?

    public var showPasswordIcon: UIImage?
    {
        didSet
        {
            self.eyeButton?.showPasswordIcon = self.showPasswordIcon
        }
    }

    public var hidePasswordIcon: UIImage?
    {
        didSet
        {
            self.eyeButton?.hidePasswordIcon = self.hidePasswordIcon
        }
    }

    public init()
    {
        super.init(frame: .zero)

        self.setupViews()
    }

    public required init?(coder: NSCoder)
    {
        super.init(coder: coder)

        self.setupViews()
    }
}


// MARK: - Override
extension EyePasswordTextField
{
    override public func awakeFromNib()
    {
        super.awakeFromNib()

        self.setupViews()
    }

    override public var tintColor: UIColor!
    {
        didSet
        {
            self.eyeButton?.tintColor = tintColor
        }
    }

    open override func rightViewRect(forBounds bounds: CGRect) -> CGRect
    {
        let x = Int(bounds.width) - Constants.sideLength - Constants.rightOffset
        let y = (Int(bounds.height) - Constants.sideLength) / 2
        let rightViewBounds = CGRect(
            x: x,
            y: y,
            width: Constants.sideLength,
            height: Constants.sideLength
        )
        return rightViewBounds
    }
}


// MARK: - Helpers
extension EyePasswordTextField
{
    private func setupViews()
    {
        self.isSecureTextEntry = true
        self.textContentType = .password

        let eyeButton = PasswordEyeButton()

        eyeButton.onSelect = { [weak self] in
            self?.fieldDelegate?.didSelectEye()
            self?.isSecureTextEntry.toggle()
        }

        self.rightViewMode = .always
        self.rightView = eyeButton
    }
}


// MARK: - Convenience props.
extension EyePasswordTextField
{
    private var eyeButton: PasswordEyeButton?
    {
        return self.rightView as? PasswordEyeButton
    }
}
