//
//  Hud.swift
//  MBProgressHUDDemo
//
//  Created by Sergey Lukaschuk on 12.05.2022.
//

import UIKit
import MBProgressHUD

class Hud {

    let title: String
    let action: HudAction

    enum HudAction {
        case indeterminateExample
        case labelExample
        case detailsLabelExample
        case determinateExample
        case annularDeterminateExample
        case barDeterminateExample
        case textExample
        case customViewExample
        case cancelationExample
        case modeSwitchingExample
        case windowExample
        case networkingExample
        case determinateNSProgressExample
        case dimBackgroundExample
        case colorExample
    }

    init(title: String, action: HudAction) {
        self.title = title
        self.action = action
    }
}

extension Hud {
    func runHub(action: HudAction, view: UIView) {
        switch action {
        case .indeterminateExample:
            indeterminateExample(to: view)
        case .labelExample:
            labelExample(to: view)
        case .detailsLabelExample:
            detailsLabelExample(to: view)
        case .determinateExample:
            determinateExample()
        case .annularDeterminateExample:
            annularDeterminateExample()
        case .barDeterminateExample:
            barDeterminateExample()
        case .textExample:
            textExample()
        case .customViewExample:
            customViewExample()
        case .cancelationExample:
            cancelationExample()
        case .modeSwitchingExample:
            modeSwitchingExample()
        case .windowExample:
            windowExample()
        case .networkingExample:
            networkingExample()
        case .determinateNSProgressExample:
            determinateNSProgressExample()
        case .dimBackgroundExample:
            dimBackgroundExample()
        case .colorExample:
            colorExample()
        }
    }

    private func indeterminateExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .indeterminate

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomething()
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func labelExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.label.text = "Loading..."

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomething()
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func detailsLabelExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.label.text = "Loading..."
        hub.detailsLabel.text = "Please, waiting!"

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomething()
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func determinateExample() {
        print(#function)
    }

    private func annularDeterminateExample() {
        print(#function)
    }

    private func barDeterminateExample() {
        print(#function)
    }

    private func textExample() {
        print(#function)
    }

    private func customViewExample() {
        print(#function)
    }

    private func cancelationExample() {
        print(#function)
    }

    private func modeSwitchingExample() {
        print(#function)
    }

    private func windowExample() {
        print(#function)
    }

    private func networkingExample() {
        print(#function)
    }

    private func determinateNSProgressExample() {
        print(#function)
    }

    private func dimBackgroundExample() {
        print(#function)
    }

    private func colorExample() {
        print(#function)
    }

    private func doSomething() {
        sleep(5)
    }
}
