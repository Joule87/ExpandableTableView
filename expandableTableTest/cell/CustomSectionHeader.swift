//
//  CustomSectionHeader.swift
//  expandableTableTest
//
//  Created by Julio Collado on 1/10/21.
//  Copyright © 2021 Julio Collado. All rights reserved.
//

import UIKit

protocol HeaderTableViewCellDelegate {
    func didTapSection(index: Int?)
}

class CustomSectionHeader: UITableViewHeaderFooterView {
    
    static let identifier = "CustomSectionHeader"
    
    @IBOutlet weak var textValueLabel: UILabel!
    
    var delegate: HeaderTableViewCellDelegate?
    var index: Int?
    
    @objc func didTapIn() {
        delegate?.didTapSection(index: index)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapIn)))
        self.contentView.backgroundColor = .green
    }
    
    
}

