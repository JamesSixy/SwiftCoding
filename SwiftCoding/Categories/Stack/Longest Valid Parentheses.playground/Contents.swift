
/// 32. Longest Valid Parentheses
/// https://leetcode.com/problems/longest-valid-parentheses/?tab=Description
/// - Parameter s: <#s description#>
/// - Returns: <#return value description#>

func longestValidParentheses(_ s: String) -> Int {
    let arr = [Character](s.characters)
    guard arr.count > 0 else { return 0 }
    var stack: [Int] = []
    var start = 0, maxLen = 0
    for (i, char) in arr.enumerated() {
        if char == "(" {
            stack.append(i) //push
        } else {
            if stack.isEmpty {
                start = i + 1
            } else {
                stack.removeLast() //pop
                if stack.isEmpty {
                    maxLen = max(i - start + 1, maxLen)
                } else {
                    maxLen = max(i - stack.last!, maxLen)
                }
            }
        }
    }
    return maxLen
}

//let testCases = ["", "(", ")", "()", ")(", "((((", "))))",
//                  ")()(", "()(", ")()", "()()", "((((()))(()"]
//for str in testCases {
//    print(longestValidParentheses(str))
//}
