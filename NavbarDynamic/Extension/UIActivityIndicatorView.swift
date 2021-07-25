//
//  UIActivityIndicatorView.swift
//  NavbarDynamic
//
//  Created by dada on 2021/7/24.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    convenience init(activityIndicatorStyle: UIActivityIndicatorView.Style, color: UIColor, placeInTheCenterOf parentView: UIView) {
        self.init(style: activityIndicatorStyle)
        self.color = .darkGray
        parentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
    }
    func start(parentView: UIView) {
        self.startAnimating()
        parentView.isUserInteractionEnabled = false
    }
    func stop(parentView: UIView) {
        self.stopAnimating()
        parentView.isUserInteractionEnabled = true
    }
}
