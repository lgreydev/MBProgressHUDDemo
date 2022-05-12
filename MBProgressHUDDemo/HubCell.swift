//
//  HubCell.swift
//  MBProgressHUDDemo
//
//  Created by Sergey Lukaschuk on 12.05.2022.
//

import UIKit
import TinyConstraints

class HubCell: UICollectionViewCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .magenta
        setupView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HubCell {
    private func setupView() {
        addSubview(titleLabel)
        titleLabel.centerInSuperview()
    }
}
