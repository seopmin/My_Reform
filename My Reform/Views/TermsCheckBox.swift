//
//  TermsCheckBox.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/09.
//

import UIKit

class TermsCheckBox: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = .systemBackground
        }

        required init?(coder: NSCoder) {
            fatalError()
        }
    
    func setChecked(_ isChecked: Bool) {
        if isChecked {
            backgroundColor = UIColor.mainColor
        } else {
            backgroundColor = .systemBackground
        }
    }
}
