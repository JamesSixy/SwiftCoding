
import ZHDataStructure

/// 439. Ternary Expression Parser
/// https://leetcode.com/problems/ternary-expression-parser/?tab=Description
/// - Parameter expression: <#expression description#>
/// - Returns: <#return value description#>

func parseTernary(_ expression: String) -> String {
    let arr = Array(expression.characters)
    guard arr.count > 0 else { return "" }
    var stack = [Character]()
    for char in arr.reversed() {
        if !stack.isEmpty && stack.last! == "?" {
            stack.removeLast() //pop "?"
            let first = stack.removeLast()
            stack.removeLast() //pop ":"
            let second = stack.removeLast()
            if char == "T" {
                stack.append(first)
            } else {
                stack.append(second)
            }
        } else {
            stack.append(char) //push
        }
    }
    return stack.isEmpty ? "" : String(stack.last!)
}
