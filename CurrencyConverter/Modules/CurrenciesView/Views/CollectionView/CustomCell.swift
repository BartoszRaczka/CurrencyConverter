//
//  CustomCell.swift
//  CurrencyConverter
//
//  Created by MacBook on 30/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CustomCell: UICollectionViewCell {
    
    
    fileprivate let cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFill
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with viewModel: CustomCellViewModel) {
        cellLabel.text = viewModel.title
    }
    
    private func setupLabel() {
        addSubview(cellLabel)
        cellLabel.textColor = .white
        cellLabel.text = ""
        cellLabel.textAlignment = .center
        
        cellLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
