//
//  CustomTableViewCell.swift
//  DemoSkeletonView
//
//  Created by Boung on 27/9/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell, SkeletonLoadable {
    
    let containerView = UIView()
    let vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let nameLayer = CAGradientLayer()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Grand Thief Auto"
        label.textAlignment = .left
        label.textColor = .darkGray
        
        return label
    }()
    
    private let rateLayer = CAGradientLayer()
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.text = "4.5 / 5.0"
        label.textAlignment = .left
        label.textColor = .darkGray
        
        return label
    }()
    
    private let priceLayer = CAGradientLayer()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "USD 30.00"
        label.textAlignment = .left
        label.textColor = .darkGray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        containerView.backgroundColor = .orange
        
        contentView.addSubview(containerView)
        containerView.fillInSuperView(padding: .init(top: 8, left: 16, bottom: 8, right: 16))
        
        containerView.addSubview(vStackView)
        vStackView.fillInSuperView(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
        vStackView.addArrangedSubview(nameLabel)
        vStackView.addArrangedSubview(rateLabel)
        vStackView.addArrangedSubview(priceLabel)
        
        nameLayer.configSkeletonLoading(for: nameLabel)
        rateLayer.configSkeletonLoading(for: rateLabel)
        priceLayer.configSkeletonLoading(for: priceLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLayer.configSkeletonFrame(from: nameLabel)
        rateLayer.configSkeletonFrame(from: rateLabel)
        priceLayer.configSkeletonFrame(from: priceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(hideLoading: Bool) {
        nameLabel.text = "Grand Thief Auto V"
        rateLabel.text = "5.0 / 5.0"
        priceLabel.text = "USD 60.00"
        
        nameLayer.isHidden = hideLoading
        rateLayer.isHidden = hideLoading
        priceLayer.isHidden = hideLoading
    }
}
