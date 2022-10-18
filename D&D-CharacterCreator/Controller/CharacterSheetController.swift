//
//  CharacterSheetController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import UIKit

class CharacterSheetController: UIViewController, UITextFieldDelegate {
    let placeholderData = ["Nome", "Classe", "Raça"]

    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.placeholder = "Nome"
        textField.setLeftPaddingPoints(18)
        return textField
    }()

    let tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        //        table.backgroundColor = .systemGray
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //        tableView.backgroundColor = .systemGray5
        //        tableView.separatorStyle = .none
        tableView.register(FormCell.self, forCellReuseIdentifier: "form_cell")
        tableView.delegate = self
        view.addSubview(textField)
        view.addSubview(tableView)
        tableView.isUserInteractionEnabled = true
        configNavBar()
        configConstraints()
        view.backgroundColor = .systemGroupedBackground
        tableView.backgroundColor = .systemGroupedBackground
    }
    func configNavBar() {
        // adicionar no cbl, como modificar large titles
        let appearance = UINavigationBarAppearance()
        //        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Criar",
                                                                 style: .plain,
                                                                 target: ExploreView(),
                                                                 action: #selector(sayHello))
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Character Sheet"
    }
     @objc func sayHello() {
         print("UHUU")
    }
    func configConstraints() {
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            textField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),

            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5)
        ])
    }
}
extension CharacterSheetController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "form_cell", for: indexPath) as? FormCell else {
            return UITableViewCell()
        }
        switch indexPath.row {

        case 0:
//            cell.selectionStyle = .none
            cell.placeholder = placeholderData[1]
        case 1:
//            cell.selectionStyle = .none
            cell.placeholder = placeholderData[2]
        default:
            break
        }
        return cell
    }
}

extension CharacterSheetController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(OptionsController(route: "classes"), animated: true)
        case 1:
            navigationController?.pushViewController(OptionsController(route: "race"), animated: true)
        default:
            break
        }
    }
}
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "form_cell", for: indexPath) as? FormCell {
//            cell.selectionStyle = .none
//            cell.placeholder = placeholderData[indexPath.row]
//            cell.dataTextField.tag = indexPath.row
//            cell.dataTextField.delegate = self
//            return cell
//        }
//        return UITableViewCell()
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
