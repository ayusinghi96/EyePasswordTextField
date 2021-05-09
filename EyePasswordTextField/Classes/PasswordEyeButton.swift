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
        fileprivate var icon: UIImage?
        {
            /// This bundle.
            let bundle = Bundle.init(for: PasswordEyeButton.self)
            let iconName: String = {
                switch self
                {
                case .open: return "showPasswordIcon"
                case .closed: return "hidePasswordIcon"
                }
            }()

            return UIImage(named: iconName, in: bundle, compatibleWith: nil)?
                .withRenderingMode(.alwaysTemplate)
        }
    }

    /// An action when button is tapped.
    var onSelect: (() -> Void)?

    /// The icon to set on eye button for `open` eye state.
    var showPasswordIcon: UIImage?
    {
        didSet { self.updateIcon() }
    }

    /// The icon to set on eye button for `closed` state.
    var hidePasswordIcon: UIImage?
    {
        didSet { self.updateIcon() }
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
    public override var tintColor: UIColor!
    {
        didSet
        {
            let proxy = Self.appearance()
            proxy.tintColor = tintColor
        }
    }

    public override func awakeFromNib()
    {
        super.awakeFromNib()
        self.setupViews()
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

        // Toggle current eye state.
        self.toggleEyeState()
        // Update button icon.
        self.updateIcon()
        // Perform selection action.
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
