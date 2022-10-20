//
//  AllCharactersController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 11/10/22.
// swiftlint:disable force_cast

import UIKit

class AllCharactersController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let coreDataMethods = CoreDataMethods()
//    var collectionView: UICollectionView = {
//        let collection = UICollectionView()
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        return collection
//    }()

    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = coreDataMethods.fetchCharacters(context: context)
        coreDataMethods.printAllCharacters(context: context)

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 160, height: 160)
//        layout.scrollDirection = .vertical
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
        backButton.title = "Voltar"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    func configConstraints() {
        collectionView?.backgroundColor = .white
//        NSLayoutConstraint.activate([
//
//            collectionView?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            collectionView?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            collectionView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
//            collectionView?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
        collectionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView?.heightAnchor.constraint(equalToConstant: 300).isActive = true
        collectionView?.widthAnchor.constraint(equalToConstant: 310).isActive = true
    }
}

extension AllCharactersController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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
        cell.raceName = "teste"
        cell.characterName = "teste"
        cell.className = "Bard"
        return cell
    }

}
