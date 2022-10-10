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
        layout.itemSize = CGSize(width: 60, height: 60)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        collectionView?.register(CardHomeCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView?.dataSource = self
//        collectionView?.delegate = self
        
        view.addSubview(collectionView ?? UICollectionView())
//        collectionView = UICollectionView(frame:.zero, collectionViewLayout: layout)
//        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = .white
    }
    func configNavBar() {
        //adicionar no cbl, como modificar large titles
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed]
        navigationItem.standardAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "D&D characters"
    }
    func buttonConstraints(){
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func callNewController(){
        navigationController?.pushViewController(CharacterSheetController(), animated: true)
    }
}

extension ExploreController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue the standard cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        //        let data = self.data[indexPath.item]
        //        cell.backgroundColor = data
        return cell
    }
}
