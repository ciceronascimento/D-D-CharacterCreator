//
//  AllCharactersController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 11/10/22.
//

import UIKit

class AllCharactersController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        confgNavBar()
        view.backgroundColor = .systemGroupedBackground
    }
    func confgNavBar() {
        let appearance = UINavigationBarAppearance()
        let backButton = UIBarButtonItem()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My Characters"
        backButton.title = "Voltar"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
