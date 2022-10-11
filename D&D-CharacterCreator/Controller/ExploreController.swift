//
//  ExploreController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import UIKit

class ExploreController: UIViewController {
    var collectionView: UICollectionView?

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var buttonConfig = UIButton.Configuration.borderedProminent()
        buttonConfig.title = "Clica"
        button.configuration = buttonConfig
        button.addTarget(self, action: #selector(callNewController), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        configNavBar()
        buttonConstraints()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 290, height: 110)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        // adicionar no cbl o que significa reuse identifier
        collectionView?.register(CardHomeCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView ?? UICollectionView())
        collectionConstraints()
        view.backgroundColor = .white
    }
    func configNavBar() {
        // adicionar no cbl, como modificar large titles
        let appearance = UINavigationBarAppearance()
        let backButton = UIBarButtonItem()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "D&D characters"
        backButton.title = "Voltar"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    func buttonConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: collectionView?.bottomAnchor ?? view.topAnchor, constant: 640),
            button.centerXAnchor.constraint(equalTo: collectionView?.centerXAnchor ?? view.centerXAnchor)
        ])
    }
    func collectionConstraints() {
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView?.heightAnchor.constraint(equalToConstant: 300).isActive = true
        collectionView?.widthAnchor.constraint(equalToConstant: 310).isActive = true
    }
    @objc func callNewController() {
        navigationController?.pushViewController(CharacterSheetController(), animated: true)
    }
}

extension ExploreController: UICollectionViewDataSource {
    func collectionView (_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView (
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        return cell
    }
}

extension ExploreController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Card: \(indexPath.row + 1)")
    }
}
