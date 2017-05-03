//
//  JiraKit.swift
//  JiraKit
//
//  Created by Yannick Heinrich on 06.09.16.
//  Copyright © 2016 yageek. All rights reserved.
//

import Foundation

public final class JiraKit: NSObject {

    fileprivate static var instance: JiraKit?

    var token: Int = 0
    fileprivate var ui: JiraKitUI

    fileprivate init(url: URL) {
        ui = JiraKitUI()
        super.init()

        ui.displayDebugButton()
    }

    public class func startWith(_ url: URL) {
        guard JiraKit.instance == nil else { return }
        let instance = JiraKit(url: url)
        JiraKit.instance = instance
    }


}
