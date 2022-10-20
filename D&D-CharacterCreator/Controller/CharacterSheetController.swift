//
//  CharacterSheetController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

// swiftlint:disable force_cast

import UIKit

class CharacterSheetController: UIViewController, UITextFieldDelegate {

    let classController = OptionsController(route: "classes")
    let raceController = OptionsController(route: "race")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let coreDataMethods = CoreDataMethods()

    let placeholderData = ["Nome", "Classe", "Raça"]

    var secondaryTextClass: String = ""
    var secondaryTextRace: String = ""

    let labelIncoming: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mais itens chegando..."
        label.textColor = .gray
        return label
    }()

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
        view.addSubview(labelIncoming)
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
                                                                 action: #selector(saveCoreData))
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Character Sheet"
    }

     @objc func saveCoreData() {

        let nameCharacter = textField.text!

         print("Nome do personagem: \(nameCharacter)")
         print("Classe: \(secondaryTextClass)")
         print("Raça: \(secondaryTextRace)")
         _ = coreDataMethods.createCharacter(name: nameCharacter,
                                             race: secondaryTextRace,
                                             classes: secondaryTextClass,
                                             context: context)
         _ = coreDataMethods.saveCharacterCoreData(context: context)
         _ = coreDataMethods.fetchCharacters(context: context)
         navigationController?.popViewController(animated: true)

    }

    func configConstraints() {

        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),

            tableView.heightAnchor.constraint(equalToConstant: 160),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),

            labelIncoming.heightAnchor.constraint(equalToConstant: 15),
            labelIncoming.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelIncoming.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 1)
//            labelIncoming.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }

}
extension CharacterSheetController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        var configuration = cell.defaultContentConfiguration()

        switch indexPath.row {
        case 0:
            configuration.text = placeholderData[1]
            configuration.secondaryText = secondaryTextClass
            cell.contentConfiguration = configuration
            cell.accessoryType = .disclosureIndicator
        case 1:
            configuration.text = placeholderData[2]
            configuration.secondaryText = secondaryTextRace
            cell.contentConfiguration = configuration
            cell.accessoryType = .disclosureIndicator
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
            navigationController?.pushViewController(classController, animated: true)
            classController.delegate = self
        case 1:
            navigationController?.pushViewController(raceController, animated: true)
            raceController.delegate = self
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: false)
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
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension CharacterSheetController: OptionsDelegate {
    func sendInfo(text: String, routeChoose: String) {
        if(routeChoose == "classes") {
            secondaryTextClass = text
            print("Escolhido: \(secondaryTextClass)")
        } else {
            secondaryTextRace = text
            print("Escolhido: \(secondaryTextRace)")
        }
        tableView.reloadData()

    }
}

//        guard let cell = tableView.dequeueReusableCell(withIdentifier:
// "form_cell", for: indexPath) as? FormCell else {
//            return UITableViewCell()\\\\\\\\\\\\]\]\\\\
//        }
//
//        var configuration = cell.defaultContentConfiguration()
//
//        switch indexPath.row {
//
//        case 0:

//            configuration.text = placeholderData[1]
//            cell.placeholder = placeholderData[1]
//        case 1:

//            cell.placeholder = placeholderData[2]
//        default:
//            break
//        }
