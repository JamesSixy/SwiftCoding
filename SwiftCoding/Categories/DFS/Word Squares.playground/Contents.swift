
import UIKit

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
}

/// 425. Word Squares
/// https://leetcode.com/problems/word-squares/?tab=Description
/// - Parameter words: <#words description#>
/// - Returns: <#return value description#>
func wordSquares(_ words: [String]) -> [[String]] {
    var res: [[String]] = []
    guard words.count > 0 else { return res }
    var container: [String] = []
    helperWS(&res, &container, words)
    return res
}

private func helperWS(_ res: inout [[String]],
                      _ container: inout [String],
                      _ words: [String]) {
    if container.count == words[0].characters.count {
        res.append(container)
        return
    }
    for word in words {
        if !isWordSquare(container, word){
            continue
        }
        container.append(word)
        helperWS(&res, &container, words)
        container.removeLast()
    }
}

private func isWordSquare(_ container: [String], _ cur: String) -> Bool {
    let numOfWords = container.count + 1
    for i in stride(from: 0, to: numOfWords, by: 1) {
        for j in stride(from: i, to: numOfWords - 1, by: 1) {
            let up = container[j]
            let down = cur
            if up[numOfWords - 1] != down[j] {
                return false
            }
        }
    }
    return true
}

/// 422. Valid Word Square
/// https://leetcode.com/problems/valid-word-square/?tab=Description
/// - Parameter words: <#words description#>
/// - Returns: <#return value description#>

//func validWordSquare(_ words: [String]) -> Bool {
//    
//}
