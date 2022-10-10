//
//  CharacterSheetController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import UIKit

class CharacterSheetController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        view.backgroundColor = .systemGroupedBackground
    }

    func configNavBar() {
        //adicionar no cbl, como modificar large titles
        let appearance = UINavigationBarAppearance()
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Character Sheet"
    }
}
