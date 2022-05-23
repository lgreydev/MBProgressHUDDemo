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


    
    let hud01 = Hud(title: "With label", action: .labelExample)
    let hud02 = Hud(title: "With details label", action: .detailsLabelExample)
    let hud10 = Hud(title: "Determinate mode", action: .determinateExample)
    let hud11 = Hud(title: "Annular determinate mode", action: .annularDeterminateExample)
    let hud12 = Hud(title: "Bar determinate mode", action: .barDeterminateExample)
    let hud20 = Hud(title: "Text only", action: .textExample)
    let hud21 = Hud(title: "Custom view", action: .customViewExample)
    let hud22 = Hud(title: "With action button", action: .cancelationExample)
    let hud23 = Hud(title: "Mode switching", action: .modeSwitchingExample)
    let hud24 = Hud(title: "On window", action: .windowExample)
    let hud30 = Hud(title: "NSURLSession", action: .networkingExample)
    let hud31 = Hud(title: "Determinate with NSProgress", action: .determinateNSProgressExample)
    let hud32 = Hud(title: "Dim background", action: .dimBackgroundExample)
    let hud33 = Hud(title: "Colored", action: .colorExample)

    lazy var huds: [[Hud]] = {
        let huds = [
            [hud00, hud01, hud02],
            [hud10, hud11, hud12],
            [hud20, hud21, hud22, hud23, hud24],
            [hud30, hud31, hud32, hud33]
        ]
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
        guard let view = navigationController?.view else { fatalError() }
        let action = huds[indexPath.section][indexPath.row].action
        huds[indexPath.section][indexPath.row].runHub(action: action, view: view)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
}
