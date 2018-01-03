//
//  ItemCacheProtocol.swift
//  cacheTest
//
//  Created by Maksim Kita on 12/28/17.
//  Copyright © 2017 Maksim Kita. All rights reserved.
//

import Foundation
import UIKit

public protocol ItemCacheProtocol {
    func toData() -> Data?
    init?(data:Data)
}

/*
extension UIImage:ItemCacheProtocol {
    func toData() -> Data? {
        guard let data = UIImagePNGRepresentation(self) else {
            return nil
        }
        return data
    }
}*/

//extension String:ItemCacheProtocol {
//    public init?(data:Data) {
//        self.init(data:data, encoding: String.Encoding.utf8)
//    }
//    public func toData() -> Data? {
//        return self.toData()
//    }
//}

