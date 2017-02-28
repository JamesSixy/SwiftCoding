
import UIKit
import ZHDataStructure

/// 139. Word Break
/// https://leetcode.com/problems/word-break/?tab=Description
/// - Parameters:
///   - s: <#s description#>
///   - wordDict: <#wordDict description#>
/// - Returns: <#return value description#>

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    return helper(s, Set(wordDict), 0)
}

private func helper(_ s: String,
                    _ set: Set<String>,
                    _ start: Int) -> Bool {
    if start == s.characters.count {
        return true
    }
    var res = false
    for i in stride(from: start + 1, through: s.characters.count, by: 1) {
        if set.contains(s[start ..< i]) {
            res = res || helper(s, set, i)
        }
    }
    return res
}


//let testS = ["leetcode", "lintcode", "laddercode", "lescode", "codelint"]
//let testD = ["leet", "code", "lint"]
//for str in testS {
//    print(wordBreak(str, testD))
//}
