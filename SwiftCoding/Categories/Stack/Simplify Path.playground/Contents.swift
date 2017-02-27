
import ZHDataStructure

/// 71. Simplify Path
/// https://leetcode.com/problems/simplify-path/?tab=Description
/// - Parameter path: <#path description#>
/// - Returns: <#return value description#>

func simplifyPath(_ path: String) -> String {
    let dirs = path.components(separatedBy: "/") //split
    var stack = [String]()
    for dir in dirs {
        if dir == ".." {
            if !stack.isEmpty {
                stack.removeLast() //pop
            }
        } else if dir == "." {
            continue
        } else if dir != "" {
            stack.append(dir) //push
        }
    }
    let res = stack.reduce("") { total, dir in "\(total)/\(dir)" }
    return res.isEmpty ? "/" : res
}


//let testCases = ["//////a/./b/../c/d/e/f"]
//for str in testCases {
//    print(simplifyPath(str))
//}
