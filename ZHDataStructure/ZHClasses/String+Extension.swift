
/*
 subscript:
 1. get str at index:                  str[0]
 2. get substring in range:      str[0 ..< 5]
 
 */
extension String {
    
    public var length: Int {
        return self.characters.count
    }
    
    public subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    public func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    public func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    public subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
}
