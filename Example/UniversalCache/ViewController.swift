//
//  ViewController.swift
//  UniversalCache
//
//  Created by kitaisreal on 01/03/2018.
//  Copyright (c) 2018 kitaisreal. All rights reserved.
//

import UIKit
import UniversalCache

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var testCache = LRUCache<String,Int>(maxSize: 20, capacity: 10) { value in
            //Clojure to calculate size of value
            return Double(MemoryLayout.size(ofValue: value))
        }
        testCache.put(key: "testKey", value: 10)
        _ = testCache.get(key: "testKey")
        _ = testCache.remove(key: "testKey")
        
        var testFileCache = LRUFileCache<String,UIImage>(maxSize: Double(Int.max),
            capacity: Int.max,
            cacheDestination:FileCacheDestination.folder("testFileCacheFolder"))
        { value in
            guard let data = value.toData() else {
                return 0
            }
            //return size in bytes
            return Double(data.count)
        }
        let testImage = UIImage()
        testFileCache.put(key: "testImage", value: testImage)
        testFileCache.get(key: "testImage") { image in
            //Use image
        }
        testFileCache.remove(key: "testImage")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIImage:ItemCacheProtocol {
    public func toData() -> Data? {
        guard let data = UIImagePNGRepresentation(self) else {
            return nil
        }
        return data
    }
}
