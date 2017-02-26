
/// String Permutation II
/// http://www.lintcode.com/en/problem/string-permutation-ii/
/// - Parameter str: <#str description#>
/// - Returns: <#return value description#>
/// Given a string, find all permutations of it without duplicates.

//Solution 1: DFS
func stringPermutation2(_ str: String) -> [String] {
    var res: [String] = []
    let arr = [Character](str.characters)
    guard arr.count > 0 else { return res }
    var container: [Character] = []
    var visited = Array(repeating: false, count: arr.count)
    helper(&res, arr.sorted(), &container, &visited)
    return res
}

private func helper(_ res: inout [String],
                    _ arr: [Character],
                    _ container: inout [Character],
                    _ visited: inout [Bool]) {
    if container.count == arr.count {
        res.append(String(container))
        return
    }
    for (i, char) in arr.enumerated() {
        if visited[i] || (i != 0 && arr[i] == arr[i - 1] && !visited[i - 1]) {
            continue
        }
        visited[i] = true
        container.append(char)
        helper(&res, arr, &container, &visited)
        container.removeLast()
        visited[i] = false
    }
}

// Solution 2: use next permutation

//TODO



//for str in ["abb", "aabb"] {
//    print(stringPermutation2(str))
//}
