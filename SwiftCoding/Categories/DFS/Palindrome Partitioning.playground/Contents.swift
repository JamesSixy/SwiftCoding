
/**
 131. Palindrome Partitioning
 Category: [DFS]
 
 Question: Given a string s, partition s such that every substring of the partition is a palindrome.
 Return all possible palindrome partitioning of s.
 
 Link: https://leetcode.com/problems/palindrome-partitioning/?tab=Description
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: , Space: O(n)
 
 */

func partition(_ s: String) -> [[String]] {
    var res: [[String]] = []
    let arr: [Character] = [Character](s.characters)
    guard arr.count > 0 else { return res }
    var container: [String] = []
    helper(&res, &container, arr, 0)
    return res
}

private func helper(_ res: inout [[String]],
                    _ container: inout [String],
                    _ arr: [Character],
                    _ start: Int) {
    if start == arr.count {
        res.append(container)
        return
    }
    for i in start ..< arr.count {
        let subarr = Array(arr[start ..< i + 1])
        if (!isPalindrome(subarr)) {
            continue
        }
        container.append(String(subarr))
        helper(&res, &container, arr, i + 1)
        container.removeLast()
    }
}

private func isPalindrome(_ arr: [Character]) -> Bool {
    var start = 0, end = arr.count - 1
    for _ in stride(from: start, to: arr.count / 2, by: 1) {
        if arr[start] != arr[end] {
            return false
        }
        start += 1
        end -= 1
    }
    return true
}

let testCases = [
    "aab",
    "abc",
    "",
    "a",
    "aaaaa"
]

for str in testCases {
    print(partition(str))
}

