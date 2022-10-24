//
//  FormCell.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 17/10/22.
//

import UIKit

class FormCell: UITableViewCell {
    var placeholder: String? {
        didSet {
            guard let item = placeholder else { return }
//            self.dataTextField.placeholder = item
            self.labelField.text = item
        }
    }

    let labelField: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let placeHolderLabelField: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.text = "Selecione"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(labelField)
        addSubview(placeHolderLabelField)
        configConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configConstraints() {
        NSLayoutConstraint.activate([
            labelField.heightAnchor.constraint(equalToConstant: 30),
            labelField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            labelField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            labelField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

            placeHolderLabelField.heightAnchor.constraint(equalToConstant: 30),
            placeHolderLabelField.leadingAnchor.constraint(equalTo: labelField.leadingAnchor, constant: 240),
            placeHolderLabelField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            placeHolderLabelField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            placeHolderLabelField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    /// Função para que a celula selecionada tenha a animação
    /// - Parameters:
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
