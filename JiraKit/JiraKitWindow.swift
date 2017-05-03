//
//  JiraKitWindow.swift
//  JiraKit
//
//  Created by Yannick Heinrich on 05.09.16.
//  Copyright © 2016 yageek. All rights reserved.
//

import UIKit

private final class TransparentView: UIView {

    fileprivate let debugButton: BugButton
    fileprivate let menu: PopMenu

    override init(frame: CGRect){
        debugButton = BugButton()
        menu = PopMenu(frame: CGRect.zero)
        super.init(frame: frame)

        addSubview(debugButton)
        addSubview(menu)

        debugButton.addTarget(self, action: #selector(TransparentView.mainButtonClicked), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func mainButtonClicked(_ sender: Any) {
        print("Main clicked")
    }
}

private final class TransparentController: UIViewController {

    var transparentView: TransparentView!
    init() {

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.transparentView = TransparentView(frame: UIScreen.main.bounds)
         self.view = self.transparentView
    }
}

final class JiraKitWindow: UIWindow {

    fileprivate let controller: TransparentController
    init() {
        controller = TransparentController()
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor.clear
        windowLevel = UIWindowLevelAlert + 1
        rootViewController = controller
        isUserInteractionEnabled = true
        screen = UIScreen.main
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if controller.transparentView.debugButton.frame.contains(point) {
            return true
        }

        return false
    }

}
