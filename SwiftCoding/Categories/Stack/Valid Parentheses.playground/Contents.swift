
import UIKit

/// 20. Valid Parentheses
/// https://leetcode.com/problems/valid-parentheses/?tab=Description
/// - Parameter s: <#s description#>
/// - Returns: <#return value description#>

func isValid(_ s: String) -> Bool {
    let arr = [Character](s.characters)
    guard arr.count > 0 else { return true }
    
    var stack: [Character] = []
    for char in arr {
        if isLeftParenthese(char: char) {
            stack.append(char) //push
        } else {
            guard !stack.isEmpty && isPair(stack.last!, char) else {
                return false
            }
            stack.removeLast() //pop
        }
    }
    return stack.isEmpty
}

private func isPair(_ left: Character, _ right: Character) -> Bool {
    return (left == "{" && right == "}") ||
           (left == "(" && right == ")") ||
           (left == "[" && right == "]")
}

private func isLeftParenthese(char: Character) -> Bool {
    return char == "{" || char == "[" || char == "("
}
