
/**
 String Permutation II
 Category: [DFS]
 
 Question: Given a string, find all permutations of it without duplicates.
 
 Link: http://www.lintcode.com/en/problem/string-permutation-ii/
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: O(n!), Space: O(n)
 
 */

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

func stringPermutation2NP(_ str: String) -> [String] {
    var res = [String]()
    guard str.characters.count > 0 else { return res }
    var next = nextPermutation(str)
    res.append(str)
    while str != next {
        res.append(next)
        next = nextPermutation(next)
    }
    return res
}

func nextPermutation(_ str: String) -> String {
    var arr = [Character](str.characters)
    guard arr.count > 0 else { return "" }
    var i = arr.count - 1, end = i
    while i > 0 && arr[i - 1] >= arr[i] {
        i -= 1
    }
    if i != 0 {
        var j = arr.count - 1
        while j > 0 && arr[j] <= arr[i - 1] {
            j -= 1
        }
        swap(&arr, i - 1, j)
    }
    reverse(&arr, i, end)
    return String(arr)
}

private func swap<T>(_ nums: inout [T], _ i: Int, _ j: Int) {
    (nums[i], nums[j]) = (nums[j], nums[i])
}

private func reverse<T>(_ nums: inout [T], _ i: Int, _ j: Int) {
    var i = i, j = j
    while i < j {
        swap(&nums, i, j)
        i += 1
        j -= 1
    }
}

for str in [
    "abb",
    "aabb"
] {
    print(stringPermutation2(str))
    print(stringPermutation2NP(str))
}

