//
//  OptionsView.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 18/10/22.
//

import UIKit

class OptionsView: UIView {
    var options: [Result] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints =  false

        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        self.backgroundColor = .systemGroupedBackground
        self.configConstraints()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//
// Task {
//    let request = await API.getData()
//    if let res = request.results {
//        print("requisição: \(res[0].name)")
//    }
// }
