//
//  Extension+Array.swift
//  Assertly
//
//  Created by Sharon Omoyeni Babatunde on 25/11/2023.
//

import Foundation

var infoPlistProperty: [String: Any]? {
    if  let path = Bundle.main.path(forResource: "Info", ofType: "plist"), let xml = FileManager.default.contents(atPath: path) {
        return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String: Any]
    }
    return nil
}

func infoPlistString(key: String) -> String {
    infoPlistProperty![key] as! String
}
