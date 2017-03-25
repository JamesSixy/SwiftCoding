
/**
 125. Valid Palindrome
 Category: [TP]
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 For example,
 "A man, a plan, a canal: Panama" is a palindrome.
 "race a car" is not a palindrome.
 
 
 Link: https://leetcode.com/problems/valid-palindrome/?tab=Description
 
 Time: O(n), Space: O(n)
 
 Idea: Two Pointers, compare left and right until they meet
 
 */

import UIKit

func isPalindrome(_ s: String) -> Bool {
    let chars = Array(s.lowercased().characters)
    
    var left = 0, right = chars.count - 1
    
    while left < right {
        while left < right && !isAlpha(chars[left]) {
            left += 1
        }
        while left < right && !isAlpha(chars[right]) {
            right -= 1
        }
        
        if chars[left] != chars[right] {
            return false
        } else {
            left += 1
            right -= 1
        }
    }
    return true
}

private func isAlpha(_ char: Character) -> Bool {
    guard let char = String(char).unicodeScalars.first else {
        fatalError("Character is invalid")
    }
    return CharacterSet.alphanumerics.contains(char)
}
