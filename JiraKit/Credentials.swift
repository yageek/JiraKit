//
//  Credentials.swift
//  JiraKit
//
//  Created by Yannick Heinrich on 09.09.16.
//  Copyright © 2016 yageek. All rights reserved.
//

import Foundation

public struct Credentials {
    fileprivate(set) var username: NSString
    fileprivate(set) var password: NSString
}

internal extension NSMutableURLRequest {

    func setBasicAuthRequest(_ credential: Credentials) {
        // set up the base64-encoded credentials
        let loginString = NSString(format: "%@:%@", credential.username, credential.password)
        let loginData: Data = loginString.data(using: String.Encoding.utf8.rawValue)!
        let base64LoginString = loginData.base64EncodedString(options: [])

        // create the request
        self.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
    }
}
