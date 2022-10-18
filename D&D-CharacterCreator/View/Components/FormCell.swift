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
            self.dataTextField.placeholder = item
        }
    }
    let dataTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.font = UIFont.systemFont(ofSize: 18)
        return textField
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dataTextField)
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
            dataTextField.heightAnchor.constraint(equalToConstant: 30),
            dataTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dataTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dataTextField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dataTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
