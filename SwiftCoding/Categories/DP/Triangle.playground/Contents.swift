
import ZHDataStructure
import UIKit

/**
 120. Triangle
 Category: [DP]
 
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
 
 
 Link: https://leetcode.com/problems/triangle/#/description
 Solution: http://www.jiuzhang.com/solutions/triangle/
 Return: <#Description#>
 
 Idea: function: f[i][j] = min(f[i-1][j-1], f[i-1][j]) + A[i][j]
 remember to initialize diagonal values and first column
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func minimumTotal(triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else { return 0 }
    
    //init
    let n = triangle.count, m = triangle[0].count
    var f = Array(repeating: Array(repeating: 0, count: m), count: n)
    f[0][0] = triangle[0][0]
    
    for i in 1 ..< n {
        f[i][0] = f[i - 1][0] + triangle[i][0]
        f[i][i] = f[i - 1][i - 1] + triangle[i][i]
    }
    
    //top down
    for i in 1 ..< n {
        for j in 1 ..< i {
            f[i][j] = min(f[i - 1][j - 1], f[i - 1][j]) + triangle[i][j]
        }
    }
    
    var best = f[n - 1][0]
    for i in 1 ..< n {
        best = min(best, f[n - 1][i])
    }
    return best
}

/**
 TestCases: <#Description#>
 */
let testCases = [
    <#Description#>
]

for <#Description#> in testCases {
    print(<#Description#>)
}






