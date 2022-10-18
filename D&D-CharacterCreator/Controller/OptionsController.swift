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
        // adicionar no cbl, como modificar large titles
        let appearance = UINavigationBarAppearance()
        //        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
//        navigationController?.navigationBar.prefersLargeTitles = false
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
        print(option.name)
    }
}

//            let request = await API.getData()
//            if let res = request.results {
//                print("requisição: \(res[0].name)")
//            }
