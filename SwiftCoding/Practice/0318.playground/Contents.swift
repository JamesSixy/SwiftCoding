

func letterCombinations(_ digits: String) -> [String] {
    var res: [String] = []
    guard digits.characters.count > 0 else { return res }
    var container = [Character]()
    letterCombinationsHelper(&res, [Character](digits.characters), &container, letterDictionary())
    return res
}

func letterCombinationsHelper(_ res: inout [String],
                        _ digits: [Character],
                        _ container: inout [Character],
                        _ dict: [Character : [Character]]) {
    if container.count == digits.count {
        res.append(String(container))
        return
    }
    let char = digits[container.count]
    guard let arr = dict[char] else { return }
    for cur in arr {
        container.append(cur)
        letterCombinationsHelper(&res, digits, &container, dict)
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