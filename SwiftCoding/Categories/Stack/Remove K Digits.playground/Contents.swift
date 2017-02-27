
import ZHDataStructure

/// 402. Remove K Digits
/// https://leetcode.com/problems/remove-k-digits/?tab=Description
/// - Parameters:
///   - num: <#num description#>
///   - k: <#k description#>
/// - Returns: <#return value description#>

/**
 Solution: 
 1.loop from left to right and keep a stack, while stack top > current char (where k > 0), pop. Then append cur.
 2.Make sure stack contains count - k elements after loop.
 3.Finally remove 0 at front.
 */

func removeKdigits(_ num: String, _ k: Int) -> String {
    var stack = [Character](), k = k
    let chars = num.characters, finalSize = chars.count - k
    
    for char in chars {
        while k > 0 &&
            !stack.isEmpty &&
            charToInt(stack.last!) > charToInt(char) {
            stack.removeLast() //pop stack top
            k -= 1
        }
        stack.append(char) //push
    }
    stack = Array(stack[0 ..< finalSize]) //Removed k, shrink
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

//let testCases = [("9988776655", 3), ("1000082", 2), ("1234567", 3)]
//for tuple in testCases {
//    print(removeKdigits(tuple.0, tuple.1))
//}

