//
//  ViewController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavBar()
        view.backgroundColor = .systemBlue
        // Do any additional setup after loading the view.
    }

    func configNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Character Creator D&D"
    }
}

