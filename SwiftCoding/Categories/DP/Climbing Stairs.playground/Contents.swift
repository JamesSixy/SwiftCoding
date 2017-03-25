
import ZHDataStructure
import UIKit

/**
 70. Climbing Stairs
 Category: [DP]
 
 Question: You are climbing a stair case. It takes n steps to reach to the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Link: https://leetcode.com/problems/climbing-stairs/#/description
 Solution: http://www.jiuzhang.com/solutions/climbing-stairs/
 
 Time: O(n), Space: O(1) or O(n)
 
 */

func climbStairs(_ n: Int) -> Int {
    //state: f[n] means the distinct ways you jump from 0 to n
    //function: f[n] = f[n - 1] + f[n - 2]
    //init f[0] = 0, f[1] = 1, f[2] = 2
    //result f[n]
    guard n > 0 else { return 0 }
    var f = Array(repeating: 0, count: n)
    f[0] = 1
    f[1] = 2
    for i in 2 ..< n {
        f[i] = f[i - 1] + f[i - 2]
    }
    return f[n - 1]
}

func climbStairsImproved(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    if (n == 1 || n == 2) {
        return n
    }
    var first = 1
    var second = 2
    var ways = 0
    for _ in 3 ..< n {
        ways = first + second
        first = second
        second = ways
    }
    return ways
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






