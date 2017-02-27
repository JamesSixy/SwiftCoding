
import ZHDataStructure

/// 402. Remove K Digits
/// https://leetcode.com/problems/remove-k-digits/?tab=Description
/// - Parameters:
///   - num: <#num description#>
///   - k: <#k description#>
/// - Returns: <#return value description#>

func removeKdigits(_ num: String, _ k: Int) -> String {
    var stack = [Character](), k = k
    let chars = num.characters, size = chars.count - k
    
    for char in chars {
        while k > 0 &&
            stack.count > 0 &&
            charToInt(char) < charToInt(stack.last!) {
            stack.removeLast()
            k -= 1
        }
        stack.append(char)
        print("\(stack), k =\(k)")
    }
    
    stack = Array(stack[0 ..< size])
    for char in stack {
        if char != "0" {
            break
        } else {
            stack.removeFirst()
        }
    }
    
    return stack.isEmpty ? "0" : String(stack)
}

private func charToInt(_ c: Character) -> Int {
    return Int(String(c))!
}

//let testCases = [("9988776655", 3), ("1000082", 2)]
//for tuple in testCases {
//    print(removeKdigits(tuple.0, tuple.1))
//}

