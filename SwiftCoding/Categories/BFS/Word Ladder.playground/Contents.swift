
import UIKit
import ZHDataStructure

/*
 127. Word Ladder
 
 Given two words (start and end), and a dictionary, find the length of shortest transformation sequence from start to end, such that:
 
 Only one letter can be changed at a time
 Each intermediate word must exist in the dictionary

 http://www.lintcode.com/en/problem/word-ladder/
 https://leetcode.com/problems/word-ladder/?tab=Description
 
 
 Returns: Shortest length of transformation
 
 */


//Solution: TLE WTF?!
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
    
    guard beginWord != endWord,
        wordList.count > 0 else { return 0 }
    
    let set = Set(wordList)
    //Leetcode doesn't contain begin & end, while lintcode contains
    //    set.insert(beginWord)
    //    set.insert(endWord)
    
    var visited = Set<String>()
    var queue = Queue<String>()
    visited.insert(beginWord)
    queue.enqueue(beginWord)
    
    var res = 1
    while !queue.isEmpty {
        res += 1
        let size = queue.count
        for _ in 0 ..< size {
            let cur = queue.dequeue()! //dequeue
            for word in transformedWordsInDict(cur, set) {
                if visited.contains(word) {
                    continue
                }
                if word == endWord {
                    return res
                }
                queue.enqueue(word)
                visited.insert(word)
            }
        }
    }
    return 0
}

private func transformedWordsInDict(_ beginWord: String,
                    _ set: Set<String>) -> [String] {
    var res = [String]()
    let letters = "abcdefghijklmnopqrstuvwxyz"
    for (index, cur) in beginWord.characters.enumerated() {
        for i in letters.characters {
            if cur != i {
                let str = beginWord[0 ..< index] + String(i) + beginWord[index + 1 ..< beginWord.characters.count]
                if set.contains(str) {
                    res.append(str)
                }
            }
        }
    }
    return res
}

//private func transformedWordsInDict(_ beginWord: String,
//                                    _ set: Set<String>) -> [String] {
//    var res = [String]()
//    let letters = "abcdefghijklmnopqrstuvwxyz"
//    for (index, cur) in beginWord.characters.enumerated() {
//        for i in letters.characters {
//            if cur == i {
//                continue
//            }
//            //replace
//            var replacedArr = Array(beginWord.characters)
//            replacedArr[index] = i
//            let str = String(replacedArr)
//            
//            if set.contains(str) {
//                res.append(str)
//            }
//        }
//    }
//    return res
//}

//let testCase = [
//    ("hit", "cog", ["hot","dot","dog","lot","log","cog"]),
//    ("dad", "gad", ["fad"]),
//    ("hit", "cog", ["hot","dot","dog","lot","log"])
//]
//for tuple in testCase {
//    print(ladderLength(tuple.0, tuple.1, tuple.2))
//}

