
import ZHDataStructure
import UIKit

/**
 Unique Paths
 Category: [DP]
 
 Question: A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below). The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below). How many possible unique paths are there? Above is a 3 x 7 grid. How many possible unique paths are there? Note: m and n will be at most 100.
 
 Link: https://leetcode.com/problems/unique-paths/#/description
 Solution: http://www.jiuzhang.com/solutions/unique-paths/
 
 state: f[m][n] how many unique paths from start to m,n
 init: f[0][0] = 0
 function: f[m][n] = f[m - 1][n] + f[m][n - 1]
 result: f[m - 1][n - 1]
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    if m == 0 || n == 0 {
        return 0
    }
    var f = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for i in 1 ..< m {
        f[i][0] = 1
    }
    
    for j in 1 ..< n {
        f[0][j] = 1
    }
    
    for i in 1 ..< m {
        for j in 1 ..< n {
            f[i][j] = f[i - 1][j] + f[i][j - 1]
        }
    }
    
    return f[m - 1][n - 1]

}

private func <#Description#>(<#Description#>) -> <#Description#> {
    
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






