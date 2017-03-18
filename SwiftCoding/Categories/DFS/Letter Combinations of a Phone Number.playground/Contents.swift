
/**
 17. Letter Combinations of a Phone Number
 Category: [DFS]
 
 Question: Given a digit string, return all possible letter combinations that the number could represent.
 A mapping of digit to letters (just like on the telephone buttons) is given below.
 Input:Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 Link: https://leetcode.com/problems/letter-combinations-of-a-phone-number/?tab=Description
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 这种组合类的问题，如果求出所有的组合方案，一定是指数级别的。
 3^n - 4^n 是对的，因为你有n位电话号码，每一位的时候，可能按出来的字母是3-4个，所以就是 (3~4)^n
 
 Time:（3~4)^n, Space: O(n)
 
 */

//DFS
func letterCombinations(_ digits: String) -> [String] {
    var res: [String] = []
    guard digits.characters.count > 0 else { return res }
    var container = [Character]()
    letterCombinationsHelper(&res, &container, [Character](digits.characters),  letterDictionary())
    return res
}

func letterCombinationsHelper(_ res: inout [String],
                              _ container: inout [Character],
                              _ digits: [Character],
                              _ dict: [Character : [Character]]) {
    if container.count == digits.count {
        res.append(String(container))
        return
    }
    let char = digits[container.count]
    guard let arr = dict[char] else { return }
    for cur in arr {
        container.append(cur)
        letterCombinationsHelper(&res, &container, digits, dict)
        container.removeLast()
    }
}

func letterDictionary() -> [Character : [Character]] {
    var dict = [Character : [Character]]()
    dict["0"] = []
    dict["1"] = []
    dict["2"] = ["a", "b", "c"]
    dict["3"] = ["d", "e", "f"]
    dict["4"] = ["g", "h", "i"]
    dict["5"] = ["j", "k", "l"]
    dict["6"] = ["m", "n", "o"]
    dict["7"] = ["p", "q", "r", "s"]
    dict["8"] = ["t", "u", "v"]
    dict["9"] = ["w", "x", "y", "z"]
    return dict
}

//BFS
func letterCombinationsBFS(_ digits: String) -> [String] {
    var res: [String] = [""]
    guard digits.characters.count > 0 else { return [] }
    let map = ["0", "1", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv",  "wxyz"]
    for (i, cur) in digits.characters.enumerated() {
        
        guard let num = Int(String(cur)) else { return [] }
        while res.first?.characters.count == i {
            let tmp = res.removeFirst()
            for char in map[num].characters {
                res.append(tmp + String(char))
            }
        }
    }
    return res
}

let testCases = [
    "2",
    "23"
]

for str in testCases {
    print(letterCombinationsBFS(str))
}
