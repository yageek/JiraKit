//
//  JiraKitUI.swift
//  JiraKitUI
//
//  Created by Yannick Heinrich on 02.09.16.
//  Copyright © 2016 yageek. All rights reserved.
//

import UIKit
internal final class JiraKitUI {
    fileprivate var debugWindow: UIWindow?

    internal func displayDebugButton() {
        let layerWindow = JiraKitWindow()
        debugWindow = layerWindow
        layerWindow.isHidden = false
    }

    //MARK: Show debug screen
    @objc fileprivate func debugButtonPressed(_ sender: UIButton) {
        showLoginScreen()
    }

    fileprivate func showLoginScreen() {
        let storyboard = UIStoryboard(name: "JIRAWorkFlow", bundle: Bundle(for: JiraKitWindow.self))
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC")

        debugWindow?.rootViewController?.present(controller, animated: true, completion: nil)
    }
}
