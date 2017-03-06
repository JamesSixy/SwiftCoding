
/// 28. Implement strStr()
/// Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack
/// https://leetcode.com/problems/implement-strstr/?tab=Description
/// - Parameters:
///   - source: <#source description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>
func strStr(_ source: String, _ target: String) -> Int {
    let sArr = [Character](source.characters)
    let tArr = [Character](target.characters)
    let sLen = sArr.count
    let tLen = tArr.count
    if tLen == 0 {
        return tLen
    }
    guard sLen > 0, tLen <= sLen else {
        return -1
    }
    for i in stride(from: 0, to: sLen - tLen + 1, by: 1) {
        var j = 0
        while j < tLen {
            if sArr[j + i] != tArr[j] {
                break
            }
            j += 1
        }
        if j == tLen {
            return i
        }
    }
    return -1
}