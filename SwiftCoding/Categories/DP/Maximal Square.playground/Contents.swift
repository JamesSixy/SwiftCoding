
/// 221. Maximal Square
/// https://leetcode.com/problems/maximal-square/?tab=Description
/// - Parameter matrix: <#matrix description#>
/// - Returns: <#return value description#>

func maximalSquare(_ matrix: [[Character]]) -> Int {
    guard matrix.count > 0 else { return 0 }
    
    let m = matrix.count
    let n = matrix[0].count
    
    var maxLen = 0
    var lens = Array(repeatElement(Array(repeatElement(0, count: n)), count: m))
    
    for i in 0 ..< m {
        for j in 0 ..< n {
            guard matrix[i][j] != "0" else { continue }
            
            if i == 0 || j == 0 {
                lens[i][j] = 1
            } else {
                lens[i][j] = min(lens[i][j - 1],
                                 lens[i - 1][j],
                                 lens[i - 1][j - 1]) + 1
            }
            
            maxLen = max(maxLen, lens[i][j])
        }
    }
    
    return maxLen * maxLen
}
