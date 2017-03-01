
import UIKit

/// 127. Word Ladder
/// https://leetcode.com/problems/word-ladder/?tab=Description
/// - Parameters:
///   - beginWord: <#beginWord description#>
///   - endWord: <#endWord description#>
///   - wordList: <#wordList description#>
/// - Returns: Shortest length of transformation

func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    
    guard beginWord != endWord,
        wordList.count > 0 else { return 0 }

    let set = Set(wordList)
    var visited = [String : Int]()
    var queue = [beginWord]
    visited[beginWord] = 0
    
    while !queue.isEmpty {
        let cur = queue.removeFirst() //dequeue
        for word in transformedWordsInDict(beginWord, set) {
            if let word = visited[word] {
            }
        }
    }
    return 0
}

private func transformedWordsInDict(_ beginWord: String, _ set: Set<String>) -> [String] {
    var res = [String]()
    let letters = (0 ..< 26).map { Character(UnicodeScalar($0)) }
    for i in letters {
        for (index, _) in beginWord.characters.enumerated() {
            var replacedArr = Array(beginWord.characters)
            replacedArr[index] = i
            let str = String(replacedArr)
            if set.contains(str) {
                res.append(str)
            }
        }
    }
    return res
}
