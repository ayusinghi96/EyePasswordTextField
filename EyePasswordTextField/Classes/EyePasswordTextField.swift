//
//  EyePasswordTextField.swift
//  EyePasswordTextField
//
//  Created by Ayush Singhi on 09/05/21.
//


import UIKit


///
/// The Password Eye button
///
open class EyePasswordTextField: UITextField
{
    ///
    /// File constants.
    ///
    private enum Constants
    {
        /// The right offset for the rightView.
        static let rightOffset = 5
        /// The side length for the subviews.
        static let sideLength = 25
    }

    /// The icon to set on eye button for show password state.
    public var showPasswordIcon: UIImage?
    {
        didSet
        {
            self.eyeButton?.showPasswordIcon = self.showPasswordIcon
        }
    }

    /// The icon to set on eye button for hide password state.
    public var hidePasswordIcon: UIImage?
    {
        didSet
        {
            self.eyeButton?.hidePasswordIcon = self.hidePasswordIcon
        }
    }

    /// The eye password text field delegate.
    public weak var fieldDelegate: EyePasswordFieldDelegate?

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
    override public var tintColor: UIColor!
    {
        didSet { self.eyeButton?.tintColor = tintColor }
    }

    override public func awakeFromNib()
    {
        super.awakeFromNib()

        self.setupViews()
    }

    open override func rightViewRect(forBounds bounds: CGRect) -> CGRect
    {
        // Provide a new frame to right view.
        //
        // Add right padding to `rightView`.
        // Vertically centre the `rightView` in the textField.
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
    /// The eye button.
    private var eyeButton: PasswordEyeButton?
    {
        return self.rightView as? PasswordEyeButton
    }

    ///
    /// Setup initial views.
    ///
    private func setupViews()
    {
        // Make sure the view is a `secureTextEntry` field at the beginning.
        self.isSecureTextEntry = true

        // Create the eye button.
        let eyeButton = PasswordEyeButton()

        // Add the required action.
        eyeButton.onSelect = { [weak self] in
            guard let self = self else { return }
            self.fieldDelegate?.didTapEyeButton(forTextfield: self)
            self.isSecureTextEntry.toggle()
        }

        // Add the button to text field.
        self.rightViewMode = .always
        self.rightView = eyeButton
    }
}
