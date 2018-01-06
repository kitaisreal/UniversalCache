# UniversalCache
**Generic Caches with LRU Algorithm**
## Cache parameters
1. **maxSize:Double** - max size of cache
2. **capacity:Int** - max count of objects in cache
3. **sizeOf:(Value) -> (Double)** - closure to count cache object size
4. **cacheDestination:FileCacheDestination** - cache destination (only for file cache)
```swift
public enum FileCacheDestination {
case temporary
case folder(String)
}
```
5. **ItemCacheProtocol** - protocol for cache values(only for file cache)
```swift
public protocol ItemCacheProtocol {
    func toData() -> Data?
    init?(data:Data)
}
```
## Example Memory Cache
```swift
var testCache = LRUCache<String,Int>(maxSize: 20, capacity: 10) { value in
            //Closure to calculate size of value
            return Double(MemoryLayout.size(ofValue: value))
        }
        testCache.put(key: "testKey", value: 10)
        _ = testCache.get(key: "testKey")
        _ = testCache.remove(key: "testKey")
```
## Example File Cache
```swift
extension UIImage:ItemCacheProtocol {
    func toData() -> Data? {
        guard let data = UIImagePNGRepresentation(self) else {
            return nil
        }
        return data
    }
}
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
```
## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

UniversalCache is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UniversalCache'
```


## Author

kitaisreal, kitaetoya@gmail.com

## License

UniversalCache is available under the MIT license. See the LICENSE file for more info.

