
import ZHDataStructure
import UIKit

/**
 29. Divide Two Integers
 Category: [MATH-FB]
 
 Question: Divide two integers without using multiplication, division and mod operator.
 If it is overflow, return MAX_INT.
 
 Link: https://leetcode.com/problems/divide-two-integers/#/description
 Solution: <#Description#>
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == 0 || dividend == 0 {
        return 0
    }
    let isNeg = (dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0)
    var dvd = abs(dividend), dvs = abs(divisor)
    guard dvd >= dvs else { return 0 }
    var sum = 0, powVal = 0, res = 0
    while dvd >= dvs {
        powVal = 1
        sum = dvs
        while sum + sum <= dvd {
            sum += sum
            powVal += powVal
        }
        dvd -= sum
        res += powVal
    }
    res = isNeg ? -res : res
    return max(min(2147483647, res), -2147483648)
}



/**
 TestCases: <#Description#>
 */
let testCases = [
    (200, 10),
    (-2147483648, -1)
]

for tuple in testCases {
    print(Int.max)
    print(divide(tuple.0, tuple.1))
}






