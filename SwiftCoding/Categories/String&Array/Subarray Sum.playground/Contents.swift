
/**
 Subarray Sum
 Category: [PrefixSum]
 
 Given an integer array, find a subarray where the sum of numbers is zero. Your code should return the index of the first number and the index of the last number.
 Given [-3, 1, 2, -3, 4], return [0, 2] or [1, 3]
 
 Link: http://www.lintcode.com/en/problem/subarray-sum/
 
 Prefix sum
 if ps[j] = ps[i], (j < i, ps[0] = -1), it means ps[i] - ps[j] = 0
 then elements from [j + 1, i] will be the result
 
 Time: O(n), Space: O(n)
 
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
