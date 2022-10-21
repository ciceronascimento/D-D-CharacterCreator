//
//  OptionsController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 18/10/22.
//

import UIKit

class OptionsController: UIViewController {

    var route: String
    var screen: OptionsView = OptionsView()
    weak var delegate: OptionsDelegate?

    internal init(route: String, screen: OptionsView = OptionsView()) {
        self.route = route
        self.screen = screen
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view = self.screen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
        configNavBar()
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
    }

    func loadTableView() {
        Task {
            screen.options = await API.getData(route: route).results ?? []
            for option in screen.options {
                print(option.name)
            }
            self.screen.tableView.reloadData()
        }
    }
    func configNavBar() {
        let backButton = UIBarButtonItem()
        backButton.title = "Voltar"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
        navigationItem.title = "Selecione o tipo"
    }

}
extension OptionsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screen.options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = screen.options[indexPath.row]
        print(option.name)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = option.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = screen.options[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)

        delegate?.sendInfo(text: option.name, routeChoose: route)
        print(option.name)
        navigationController?.popViewController(animated: true)
    }
}

protocol OptionsDelegate: AnyObject {
    func sendInfo(text: String, routeChoose: String)
}
