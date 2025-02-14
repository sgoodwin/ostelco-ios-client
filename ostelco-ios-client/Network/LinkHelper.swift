//
//  LinkHelper.swift
//  ostelco-ios-client
//
//  Created by mac on 6/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

public struct LinkHelper {
    public static func getLastPathFromLink(_ link: URL) -> String {
        return link.pathComponents.last ?? ""
    }
    
    public static func parseLink(_ link: URL) -> [String: String] {
        var ret = [String: String]()
        
        if let urlComponents = URLComponents(url: link, resolvingAgainstBaseURL: false), let queryItems = urlComponents.queryItems {
            for queryItem in queryItems {
                ret[queryItem.name] = queryItem.value
            }
        }
        
        return ret
    }
    
    public static func linkContainsParams(_ link: URL, paramKeys: [String]) -> Bool {
        let params = parseLink(link)
        
        if paramKeys.contains(where: { params[$0] == nil }) {
            // One of the parameters is nil, the link does not contain the given params
            return false
        } else {
            // All passed in parameters have a value.
            return true
        }
    }
}
