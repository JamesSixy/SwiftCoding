
/**
 311. Sparse Matrix Multiplication
 Category: [<#Description#>]
 
 Question: Given two sparse matrices A and B, return the result of AB.
 You may assume that A's column number is equal to B's row number.
 
 A = [
 [ 1, 0, 0],
 [-1, 0, 3]
 ]
 B = [
 [ 7, 0, 0 ],
 [ 0, 0, 0 ],
 [ 0, 0, 1 ]
 ]
      |  1 0 0 |   | 7 0 0 |   |  7 0 0 |
 AB = | -1 0 3 | x | 0 0 0 | = | -7 0 3 |
      | 0 0 1 |
 
 
 Link: https://leetcode.com/problems/sparse-matrix-multiplication/?tab=Description
 Solution: http://www.jiuzhang.com/solutions/sparse-matrix-multiplication/
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
 */

//optimized, not the TLE way
func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    let rowsA = A.count, colsB = B[0].count
    var res = Array(repeating: Array.init(repeating: 0, count: colsB), count: rowsA)
    for (i, row) in res.enumerated() {
        for k in 0 ..< row.count {
            if res[i][k] != 0 {
                for j in 0 ..< colsB {
                    res[i][j] += A[i][k] * B[k][j]
                }
            }
        }
    }
    return res
}
