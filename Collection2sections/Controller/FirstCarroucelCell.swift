//
//  FirstCarroucelCell.swift
//  Collection2sections
//
//  Created by gustavo.cosenza on 03/07/21.
//

import UIKit

class FirstCarroucelCell: UICollectionViewCell {
 
    private var label: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 10)
        lb.numberOfLines = 2
        return lb
    }()
    
    func configure(string: String) {
        contentView.backgroundColor = .white
        label.text = string
        contentView.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
