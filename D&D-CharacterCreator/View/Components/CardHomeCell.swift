//
//  CardHomeCell.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import UIKit
import SwiftUI

class CardHomeCell: UICollectionViewCell {
    // pesquisar modificadores de acesso para classes, usar protocolo ou função para alterar texto
    var cardName: String = "Titulo card"
    var imageName: String = "party"

    fileprivate let backGround: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        
        imgView.image = UIImage(named: "party")
        imgView.backgroundColor = .red
        return imgView
    }()
    lazy fileprivate var label: UILabel = {
       let label = UILabel()
        label.text = cardName
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
//        label.font = .preferredFont(forTextStyle: .title2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(backGround)
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .red
        contentView.layer.shadowColor = UIColor(.black).cgColor
        contentView.layer.shadowRadius = 10
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init() has not been implemented")
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backGround.topAnchor.constraint(equalTo: contentView.topAnchor),
            backGround.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backGround.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backGround.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 120),
            label.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}
