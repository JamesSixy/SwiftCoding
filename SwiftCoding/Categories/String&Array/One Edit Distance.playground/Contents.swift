
/**
 161. One Edit Distance
 Category: []
 
 Question: Given two strings S and T, determine if they are both one edit distance apart.
 
 Link: https://leetcode.com/problems/one-edit-distance/?tab=Description
 Return: all subsets
 
 Idea: Two pointers to determine two strings' mutation
 
 Time: O(n), Space: O(n)
 
 */
func isOneEditDistance(_ s: String, _ t: String) -> Bool {
    
    let sChars = [Character](s.characters), tChars = [Character](t.characters)
    var foundDiff = false, i = 0, j = 0
    
    let shorter = sChars.count < tChars.count ? sChars : tChars
    let longer = sChars.count < tChars.count ? tChars : sChars
    
    guard longer.count - shorter.count <= 1 && s != t else {
        return false
    }
    
    while i < shorter.count && j < longer.count {
        if shorter[i] != longer[j] {
            if foundDiff {
                return false
            }
            foundDiff = true
            if shorter.count < longer.count {
                j += 1
            } else {
                i += 1
                j += 1
            }
        } else {
            i += 1
            j += 1
        }
    }
    return true
}