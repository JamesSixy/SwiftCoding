
/// 17. Letter Combinations of a Phone Number
/// https://leetcode.com/problems/letter-combinations-of-a-phone-number/?tab=Description
/// - Parameter digits: <#digits description#>
/// - Returns: [String]

/*
 Given a digit string, return all possible letter combinations that the number could represent.
 A mapping of digit to letters (just like on the telephone buttons) is given below.
 Input:Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 
 1.helper input
 2.base case
 3.for loop
 4.recursion
 5.continue/return cases
 
 */
func letterCombinations(_ digits: String) -> [String] {
    var res: [String] = []
    let arr = [Character](digits.characters)
    guard arr.count > 0 else {
        return res
    }
    var container: [Character] = []
    helper(&res, &container, arr, getNumberDict())
    return res
}

private func helper(_ res: inout [String],
                    _ container: inout [Character],
                    _ arr: [Character],
                    _ dict: [Character : [Character]]) {
    if container.count == arr.count {
        res.append(String(container))
        return
    }
    guard let letters = dict[arr[container.count]] else {
        return
    }
    for char in letters {
        container.append(char)
        helper(&res, &container, arr, dict)
        container.removeLast()
    }
}

private func getNumberDict() -> [Character : [Character]] {
    var dict: [Character : [Character]] = [:]
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

