
/// Subarray Sum
/// http://www.lintcode.com/en/problem/subarray-sum/
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>
/* 
 Prefix sum
 if ps[j] = ps[i], (j < i, ps[0] = -1), it means ps[i] - ps[j] = 0
 then elements from [j + 1, i] will be the result
 */

func subarraySum(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    var dict = [Int : Int](), sum = 0
    dict[0] = -1
    for (i, num) in nums.enumerated() {
        sum += num
        if let index = dict[sum] {
            return [index + 1, i]
        }
        dict[sum] = i
    }
    return [] //not found
}

let testCases = [
    [-1, 2, 3, -1, -2],
    [3, 0, -11, 9, -1, -3, 8]
]

for arr in testCases {
    print(subarraySum(arr))
}

/*
 [-1, 2, 3, -1, -2]
 (0, -1)
 sum = -1, (-1, 0)
 sum = 1, (1, 1)
 sum = 4, (4, 2)
 sum = 3, (3, 3)
 sum = 1, return [1 + 1, 4]
 */