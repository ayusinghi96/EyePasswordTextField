//
//  PasswordEyeButton.swift
//  EyePasswordTextField
//
//  Created by Ayush Singhi on 09/05/21.
//

import UIKit

///
/// The Password Eye button
///
public class PasswordEyeButton: UIButton
{
    ///
    /// State of the eye.
    ///
    private enum EyeState
    {
        /// Eye is open, password is hidden.
        case open
        /// Eye is closed, password is visible.
        case closed

        /// Icon for this state.
        fileprivate var icon: UIImage
        {
            let bundle = Bundle.init(for: PasswordEyeButton.self)
            switch self
            {
            case .open:
                let icon = UIImage(named: "showPasswordIcon", in: bundle, compatibleWith: nil)?
                    .withRenderingMode(.alwaysTemplate)
                return icon ?? UIImage()
            case .closed:
                let icon = UIImage(named: "hidePasswordIcon", in: bundle, compatibleWith: nil)?
                    .withRenderingMode(.alwaysTemplate)
                return icon ?? UIImage()
            }
        }
    }

    /// An action when button is tapped.
    var onSelect: (() -> Void)?

    var showPasswordIcon: UIImage?
    {
        didSet
        {
            if self.eyeState == .open
            {
                self.setImage(self.showPasswordIcon ?? self.eyeState.icon, for: .normal)
            }
        }
    }

    var hidePasswordIcon: UIImage?
    {
        didSet
        {
            if self.eyeState == .closed
            {
                self.setImage(self.hidePasswordIcon ?? self.eyeState.icon, for: .normal)
            }
        }
    }

    /// Current eye state.
    private var eyeState: EyeState = .open

    init()
    {
        super.init(frame: .zero)
        self.setupViews()
    }

    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        self.setupViews()
    }
}


// MARK: - Override
extension PasswordEyeButton
{
    public override func awakeFromNib()
    {
        super.awakeFromNib()

        self.setupViews()
    }

    public override var tintColor: UIColor!
    {
        didSet
        {
            let proxy = Self.appearance()
            proxy.tintColor = tintColor 
        }
    }
}


// MARK: - Action
extension PasswordEyeButton
{
    ///
    /// Handle the button action to toggle the checkbox.
    ///
    @objc private func onButtonTapped()
    {
        guard self.isEnabled else { return }

        self.toggleEyeState()
        self.updateIcon()

        self.onSelect?()
    }
}


// MARK: -  Helpers
extension PasswordEyeButton
{
    ///
    /// Setup views.
    ///
    private func setupViews()
    {
        self.frame.size = CGSize(width: 20, height: 20)
        self.tintColor = .lightGray
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit

        if #available(iOS 13.0, *) {
            self.scalesLargeContentImage = true
        }

        self.setImage(self.eyeState.icon, for: .normal)

        self.addTarget(
            self,
            action: #selector(self.onButtonTapped),
            for: .touchUpInside
        )
    }

    ///
    /// Toggle current eye state.
    ///
    private func toggleEyeState()
    {
        if self.eyeState == .closed { self.eyeState = .open }
        else if self.eyeState == .open { self.eyeState = .closed }
    }

    ///
    /// Check the checkbox.
    ///
    private func updateIcon()
    {
        let image = self.eyeState == .open
            ? self.showPasswordIcon
            : self.hidePasswordIcon

        self.setImage(image ?? self.eyeState.icon, for: .normal)
    }
}
