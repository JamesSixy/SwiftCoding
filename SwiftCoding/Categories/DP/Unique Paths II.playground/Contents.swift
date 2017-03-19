
import ZHDataStructure
import UIKit

/**
 Unique Paths II
 Category: [DP]
 
 Question: A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below). The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below). How many possible unique paths are there? Above is a 3 x 7 grid. How many possible unique paths are there? Note: m and n will be at most 100.
 
 Link: https://leetcode.com/problems/unique-paths-ii/#/description
 Solution: http://www.jiuzhang.com/solutions/unique-paths-ii/
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    guard obstacleGrid.count > 0 else { return 0 }
    //init
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    var f = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for i in 0 ..< m {
        if obstacleGrid[i][0] == 1 {
            break
        }
        f[i][0] = 1
    }
    
    for j in 0 ..< n {
        if obstacleGrid[0][j] == 1 {
            break
        }
        f[0][j] = 1
    }
    
    for i in 1 ..< m {
        for j in 1 ..< n {
            if obstacleGrid[i][j] == 1 {
                f[i][j] = 0
            } else {
                f[i][j] = f[i - 1][j] + f[i][j - 1]
            }
        }
    }
    
    return f[m - 1][n - 1]
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






