//
//  Hud.swift
//  MBProgressHUDDemo
//
//  Created by Sergey Lukaschuk on 12.05.2022.
//

import Foundation

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
    func runHub(action: HudAction) {
        switch action {
        case .indeterminateExample:
            indeterminateExample()
        case .labelExample:
            labelExample()
        case .detailsLabelExample:
            detailsLabelExample()
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

    private func indeterminateExample() {
        print(#function)
    }

    private func labelExample() {
        print(#function)
    }

    private func detailsLabelExample() {
        print(#function)
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
}
