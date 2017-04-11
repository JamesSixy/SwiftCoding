
import ZHDataStructure

/**
 269. Alien Dictionary
 Category: [BFS]
 
 Question: There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.
 
 Example 1:
 Given the following words in dictionary,
 
 [
 "wrt",
 "wrf",
 "er",
 "ett",
 "rftt"
 ]
 The correct order is: "wertf".
 
 Example 2:
 Given the following words in dictionary,
 
 [
 "z",
 "x"
 ]
 The correct order is: "zx".
 
 Example 3:
 Given the following words in dictionary,
 
 [
 "z",
 "x",
 "z"
 ]
 The order is invalid, so return "".
 
 Note:
 You may assume all letters are in lowercase.
 You may assume that if a is a prefix of b, then a must appear before b in the given dictionary.
 If the order is invalid, return an empty string.
 There may be multiple valid order of letters, return any one of them is fine.
 
 Link: https://leetcode.com/problems/alien-dictionary/?tab=Description
 
 Summary:

 Time: O(n), Space: O(n) ---- n = number of characters
 
 */

typealias Position = (x: Int, y: Int, val: String)

func alienOrder(_ words: [String]) -> String {
    guard words.count > 0 else { return [] }
    
    var set = Set<String>(), last: String?, res = ""
    var queue = [Position]()
    for (word, index) in words.enumerated() {
        guard word.characters.count > 0 else { continue }
        queue.append(Position(0, index, word[0]))
    }
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        if set.contains(cur.val) {
            if let last = last where last != cur.val {
                return ""
            } else {
                res = res + cur.val
            }
        } else {
            set.insert(cur.val)
            last = cur
        }
        //enqueue next
        let word = words[cur.y]
        guard cur.x + 1 < word.characters.count else { continue }
        queue.append(Position(cur.x + 1, cur.y, word[cur.x + 1]))
    }
    return res
}








