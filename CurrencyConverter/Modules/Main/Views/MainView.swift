//
//  MainView.swift
//  CurrencyConverter
//
//  Created by MacBook on 05/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    
    var titleView: TitleView!
    
//    var viewModel: MainViewModel
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        viewModel = MainViewModel
        setupTitleLabel()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        titleView = TitleView()
        addSubview(titleView)
        
        titleView.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(snp.top).offset(60.0)
            make.height.equalTo(60.0)
        }
    }
}
