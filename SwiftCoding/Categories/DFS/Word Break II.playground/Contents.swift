
/// 140. Word Break II
/// https://leetcode.com/problems/word-break-ii/?tab=Description
/// - Parameters:
///   - s: <#s description#>
///   - wordDict: <#wordDict description#>
/// - Returns: <#return value description#>

//func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
//    var res = [String]()
//    let arr = [Character](s.characters)
//    guard arr.count > 0 else { return res }
//    var container: [Character] = []
//    wbHelper(&res, &container, arr, Set(wordDict), 0)
//    return res
//}
//
//private func wbHelper(_ res: inout [String],
//                      _ container: inout [Character],
//                      _ arr: [Character],
//                      _ set: Set<String>,
//                      _ start: Int) {
//    if start == arr.count {
//        res.append(String(container))
//        return
//    }
//    for i in stride(from: start, to: arr.count, by: 1) {
//        let sub = String(Array(arr[start ..< i + 1]))
//        if set.contains(sub) {
//            var subLen = sub.characters.count
//            if container.count != 0 {
//                container.append(" ")
//                subLen += 1
//            }
//            container += [Character](sub.characters)
//            wbHelper(&res, &container, arr, set, container.count)
//            container.removeLast(subLen)
//        }
//    }
//}


