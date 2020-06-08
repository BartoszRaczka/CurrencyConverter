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

class ButtonView: UIView {
    
    private var button: UIButton!
    private var viewModel: MainViewModel!
       
       override init(frame: CGRect) {
           super.init(frame: frame)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       convenience init() {
           self.init(frame: .zero)
        setupButton()
       }
    
    @objc func didTapButton() {
        
    }
    
    private func setupButton() {
        button = UIButton()
        button.setTitle("Check currencies", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        addSubview(button)
        
        button.snp.makeConstraints { make in
          make.edges.equalToSuperview()
        }
    }
    
}
