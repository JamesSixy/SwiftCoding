
/// 150. Evaluate Reverse Polish Notation
/// https://leetcode.com/problems/evaluate-reverse-polish-notation/?tab=Description
/// - Parameter tokens: <#tokens description#>
/// - Returns: <#return value description#>

func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    for str in tokens {
        if isNumber(str) {
            stack.append(Int(str)!)
        } else {
            guard stack.count >= 2 else { return 0 }
            let post = stack.removeLast()
            let prev = stack.removeLast()
            let res = operate(prev, post, str)
            stack.append(res) //push
        }
    }
    return stack.isEmpty ? 0 : stack.first!
}

private func operate(_ prev: Int,
                     _ post: Int,
                     _ token: String) -> Int {
    switch token {
    case "+":
        return prev + post
    case "-":
        return prev - post
    case "*":
        return prev * post
    default:
        return prev / post
    }
}

private func isNumber(_ str: String) -> Bool {
    return Int(str) != nil
}