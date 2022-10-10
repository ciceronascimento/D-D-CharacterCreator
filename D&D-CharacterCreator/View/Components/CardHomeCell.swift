//
//  CardHomeCell.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import UIKit
import SwiftUI

class CardHomeCell: UICollectionViewCell {
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init() has not been implemented")
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            bg.topAnchor.constraint(equalTo: contentView.topAnchor),
            bg.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            bg.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
