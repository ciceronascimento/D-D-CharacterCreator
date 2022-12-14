//
//  ExploreController.swift
//  D&D-CharacterCreator
//
//  Created by Cicero Nascimento on 10/10/22.
//

import UIKit

class ExploreController: UIViewController {
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 290, height: 110)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 40
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(CardHomeCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView ?? UICollectionView())
        collectionConstraints()
        view.backgroundColor = .secondarySystemGroupedBackground
        collectionView?.backgroundColor = .secondarySystemGroupedBackground
    }

    /// Configura a navBar
    func configNavBar() {
        let appearance = UINavigationBarAppearance()
        let backButton = UIBarButtonItem()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
        self.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "D&D characters"
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    /// Configura as constraints
    func collectionConstraints() {
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView?.heightAnchor.constraint(equalToConstant: 300).isActive = true
        collectionView?.widthAnchor.constraint(equalToConstant: 310).isActive = true
    }
}

extension ExploreController: UICollectionViewDataSource {

    // MARK: Fun????es de configura????es do DataSource da CollectionView
    func collectionView (_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView (
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MyCell",
            for: indexPath) as? CardHomeCell else {
            return UICollectionViewCell()
        }
        // MARK: Configura????o para sombras e opacidades
        cell.layer.shadowColor = UIColor(.black).cgColor
        cell.layer.shadowRadius = 3
        cell.layer.shadowOpacity = 0.9
        cell.layer.shadowOffset = CGSize(width: 1, height: 3)
        // Verifica o index do card e passa como parametros o titulo e o nome da imagem correspondente
        switch indexPath.row {
        case 0:
            cell.cardName = "Character sheet"
            cell.imageName = "newChar"
        case 1:
            cell.cardName = "My characters"
            cell.imageName = "party"
        default:
            break
        }

        return cell
    }

}

extension ExploreController: UICollectionViewDelegate {

    // MARK: Fun????es de configura????es do Delegate da CollectionView
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Verifica o index do card e faz a navega????o correspondente ao t??tulo
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(CharacterSheetController(), animated: true)
        case 1:
            navigationController?.pushViewController(AllCharactersController(), animated: true)
        default:
            break
        }
    }
}
