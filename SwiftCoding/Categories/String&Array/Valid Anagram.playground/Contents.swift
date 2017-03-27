
/// 242. Valid Anagram
/// https://leetcode.com/problems/valid-anagram/?tab=Description
/// - Parameters:
///   - s: <#s description#>
///   - t: <#t description#>
/// - Returns: <#return value description#>

/**
 * Question Link: https://leetcode.com/problems/valid-anagram/
 * Primary idea: Transfer string to char array and sort, compare the sort one
 * Time Complexity: O(nlogn), Space Complexity: O(1)
 */

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.characters.count == t.characters.count else { return false }
    return sortStr(s) == sortStr(t)
}

private func sortStr(_ s: String) -> [Character] {
    let sChars = [Character](s.characters)
    sChars.sorted {$0 < $1}
    return sChars
}
