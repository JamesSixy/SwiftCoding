
import ZHDataStructure
import UIKit

/**
 Minimum Path Sum - Category: [DP]
 Question: Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
 
 Note: You can only move either down or right at any point in time.
 
 Link: https://leetcode.com/problems/minimum-path-sum/#/description
 Solution: http://www.jiuzhang.com/solutions/minimum-path-sum/
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func minPathSum(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else { return 0 }

    //initialze array and first row + first column
    let rows = grid.count
    let columns = grid[0].count
    var f = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    
    f[0][0] = grid[0][0]
    
    for i in 1 ..< rows {
        f[i][0] = f[i - 1][0] + grid[i][0]
    }
    
    for j in 1 ..< columns {
        f[0][j] = f[0][j - 1] + grid[0][j]
    }
    
    //function: f[m][n] = min(f[m - 1][n], f[m][n - 1]) + A[m][n]
    //top down
    for i in 1 ..< rows {
        for j in 1 ..< columns {
            f[i][j] = min(f[i - 1][j], f[i][j - 1]) + grid[i][j]
        }
    }
    
    //result
    return f[rows - 1][columns - 1]
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






