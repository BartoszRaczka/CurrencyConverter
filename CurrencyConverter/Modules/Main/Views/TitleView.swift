//
//  TitleView.swift
//  CurrencyConverter
//
//  Created by MacBook on 06/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class TitleView: UIView {
    
    var titleLabel: UILabel!
       
       override init(frame: CGRect) {
           super.init(frame: frame)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       convenience init() {
           self.init(frame: .zero)
        setupTitleLabel()
       }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "asd "
        titleLabel.font = UIFont.systemFont(ofSize: 120.0, weight: .bold)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            
        }
        
    }
}
