
/// 38. Count and Say
/// https://leetcode.com/problems/count-and-say/?tab=Description
/// https://segmentfault.com/a/1190000003849544
/// - Parameter n: <#n description#>
/// - Returns: String

//Solution 1: iterative
func countAndSay(_ n: Int) -> String {
    guard n > 0 else { return "" }
    var arr: [Character] = ["1"]
    for _ in 1 ..< n {
        var copy = arr
        var last = arr[0], count = 1
        for j in 1 ..< arr.count {
            if last == copy[j] {
                count += 1
            } else {
                copy.append(Character(String(count)))
                copy.append(last)
                count = 1
                last = arr[j]
            }
        }
        copy.append(Character(String(count)))
        copy.append(last)
        arr = copy
    }
    return String(arr)
}