# UniversalCache

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

