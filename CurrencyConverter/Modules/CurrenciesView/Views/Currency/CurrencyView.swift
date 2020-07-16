//
//  CurrencyView.swift
//  CurrencyConverter
//
//  Created by MacBook on 08/06/2020.
//  Copyright © 2020 Bartosz Raczka Development. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CurrencyView: UIView {
    
    let viewModel: CurrencyViewModel //viewmodel.collectionViewModel
    
    var collectionView: CollectionView!
    
    init(with viewModel: CurrencyViewModel){
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        collectionView = CollectionView(with: viewModel.collectionViewModel)
        addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
}
