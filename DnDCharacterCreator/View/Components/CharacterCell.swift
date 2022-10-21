//
//  CharacterCell.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 20/10/22.
//

import UIKit

class CharacterCell: UICollectionViewCell {

    var characterName: String? {
        didSet {
            guard let name = characterName else { return }
            self.labelName.text = name
        }
    }
    var className: String? {
        didSet {
            guard let className = className else { return }
            backGround.image = UIImage(named: className)
            self.labelClass.text = "Class: \(className)"
        }
    }
    var raceName: String? {
        didSet {
            guard let raceName = raceName else {return}
            self.labelRace.text = "Race: \(raceName)"
        }
    }

    lazy fileprivate var labelName: UILabel = {
       let label = UILabel()
        label.text = characterName
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy fileprivate var labelClass: UILabel = {
       let label = UILabel()
        label.text = className
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy fileprivate var labelRace: UILabel = {
       let label = UILabel()
        label.text = raceName
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    fileprivate let backGround: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        imgView.image = UIImage(named: "party")
        imgView.layer.backgroundColor = UIColor.black.cgColor
        imgView.layer.opacity = 0.8
        imgView.backgroundColor = .black
        return imgView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(backGround)
        contentView.addSubview(labelName)
        contentView.addSubview(labelClass)
        contentView.addSubview(labelRace)
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .black
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

//            labelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            labelName.heightAnchor.constraint(equalToConstant: 120),
//            labelName.widthAnchor.constraint(equalToConstant: 170),

            labelClass.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelClass.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 50),
//            labelClass.heightAnchor.constraint(equalToConstant: 120),
            labelClass.widthAnchor.constraint(equalToConstant: 170),

            labelRace.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelRace.topAnchor.constraint(equalTo: labelClass.bottomAnchor, constant: 10),
//            labelRace.heightAnchor.constraint(equalToConstant: 120),
            labelRace.widthAnchor.constraint(equalToConstant: 170),

            backGround.topAnchor.constraint(equalTo: contentView.topAnchor),
            backGround.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backGround.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backGround.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
