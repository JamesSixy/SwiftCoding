
/// 125. Valid Palindrome
/// https://leetcode.com/problems/valid-palindrome/?tab=Description
/// - Parameter s: <#s description#>
/// - Returns: <#return value description#>
/// O(n) time and space

import UIKit

func isPalindrome(_ s: String) -> Bool {
    let chars = Array(s.lowercased().characters)
    
    var left = 0
    var right = chars.count - 1
    
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