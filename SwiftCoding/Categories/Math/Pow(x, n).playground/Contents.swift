
/// 50. Pow(x, n)
/// https://leetcode.com/problems/powx-n/?tab=Description
/// - Parameters:
///   - x: <#x description#>
///   - n: <#n description#>
/// - Returns: <#return value description#>
/**
 50. Pow(x, n)
 Category: [<#Description#>]
 
 Question: <#Description#>
 
 Link: https://leetcode.com/problems/powx-n/?tab=Description
 Solution: https://segmentfault.com/a/1190000003756872
 Return: <#Description#>
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
 */

func myPow(_ x: Double, _ n: Int) -> Double {
    if n < 0 {
        return 1 / powHelper(x, -n)
    } else {
        return powHelper(x, n)
    }
}

private func powHelper(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1.0
    }
    if n == 1 {
        return x
    }
    let val = powHelper(x, n / 2)
    if n % 2 == 0 {
        return val * val
    } else {
        return val * val * x
    }
}