
import UIKit
import ZHDataStructure

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
