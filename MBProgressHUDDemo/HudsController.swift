//
//  HudsController.swift
//  MBProgressHUDDemo
//
//  Created by Sergey Lukaschuk on 12.05.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class HudsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let hud00 = Hud(title: "Indeterminate mode", action: .indeterminateExample)

    lazy var huds: [[Hud]] = {
        let huds = [[hud00]]
        return huds
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(HubCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        navigationItem.title = "Huds"
    }
}

// MARK: - DataSource
extension HudsController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return huds.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return huds[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HubCell
        cell.titleLabel.text = huds[indexPath.section][indexPath.row].title
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
