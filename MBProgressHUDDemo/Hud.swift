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
    }

    init(title: String, action: HudAction) {
        self.title = title
        self.action = action
    }
}
