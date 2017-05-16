
import ZHDataStructure
import UIKit

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
func ladderLength(_ beginWord: String,
                  _ endWord: String,
                  _ wordList: [String]) -> Int {

    var len = 0
    guard beginWord != endWord else { return len }
    var set = Set<String>(wordList)
    set.insert(beginWord)
    set.insert(endWord)
    
    var queue = [beginWord]
    while !queue.isEmpty {
        let size = queue.count
        len += 1
        for _ in 0 ..< size {
            let cur = queue.removeFirst()
            for word in transform(set, cur) {
                if word == endWord {
                    return len
                }
                queue.append(word)
                set.insert(word)
            }
        }
    }
    return len
    
}

private func transform(_ set: Set<String>, _ word: String) -> [String] {
    let alpha = "abcdefghijklmnopqrstuvwxyz"
    for letter in alpha.characters {
        for char in word.characters {
            
        }
    }
    
}