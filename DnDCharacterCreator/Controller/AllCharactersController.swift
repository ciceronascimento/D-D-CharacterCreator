//
//  AllCharactersController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 11/10/22.
// swiftlint:disable force_cast

import UIKit

class AllCharactersController: UIViewController {

    var sheets: [Character] = []

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let coreDataMethods = CoreDataMethods()

    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

//        _ = coreDataMethods.fetchCharacters(context: context)

        sheets = coreDataMethods.fetchCharacters(context: context)

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 340, height: 240)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(CharacterCell.self, forCellWithReuseIdentifier: "cellCharacter")
        collectionView?.dataSource = self

        view.addSubview(collectionView ?? UICollectionView())
//        collectionView.delegate = self
        confgNavBar()
        configConstraints()
        view.backgroundColor = .systemGroupedBackground
    }

    func confgNavBar() {
        let appearance = UINavigationBarAppearance()
        let backButton = UIBarButtonItem()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "My Characters"
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    func configConstraints() {
        collectionView?.backgroundColor = .systemGroupedBackground
        collectionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView?.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        collectionView?.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

extension AllCharactersController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sheets.count
    }

    func collectionView (
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cellCharacter",
            for: indexPath) as? CharacterCell else {
            return UICollectionViewCell()
        }
        // MARK: Configuração para sombras e opacidades
        cell.layer.shadowColor = UIColor(.black).cgColor
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.9
        cell.layer.shadowOffset = CGSize(width: 1, height: 3)
        cell.raceName = sheets[indexPath.row].race
        cell.characterName = sheets[indexPath.row].name
        cell.className = sheets[indexPath.row].classes
        return cell
    }
}
