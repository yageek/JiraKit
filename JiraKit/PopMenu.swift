//
//  PopMenu.swift
//  JiraKit
//
//  Created by Yannick Heinrich on 03.05.17.
//  Copyright © 2017 yageek. All rights reserved.
//

import UIKit

struct MenuButton {
    let title: String
    let icon: UIImage?
}

final class PopMenu: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        for _ in 0..<3 {
            let view = UIView(frame: CGRect(origin: CGPoint(x: -10000, y: -1000), size: CGSize(width: 50, height: 50)))
            view.backgroundColor = UIColor.red
            addSubview(view)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
