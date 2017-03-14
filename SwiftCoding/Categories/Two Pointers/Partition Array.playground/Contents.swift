
/// Partition Array
/// http://www.lintcode.com/en/problem/partition-array/
/// - Parameters:
///   - nums: <#nums description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

func partitionArray(_ nums: [Int], _ k: Int) -> Int {

    guard nums.count > 0 else { return -1 }
    var nums = nums
    var start = 0, end = nums.count - 1
    while start < end {
        while start < end && nums[start] < k {
            start += 1
        }
        while start < end && nums[end] >= k {
            end -= 1
        }
        if start < end {
            let tmp = nums[start]
            nums[start] = nums[end]
            nums[end] = tmp
        }
    }
    //always end = start, cur and k
    if nums[start] < k {
        return start + 1
    }
    return start
}

func partitionArrayV2(_ nums: [Int], _ k: Int) -> Int {
    
    guard nums.count > 0 else { return -1 }
    var nums = nums
    var start = 0, end = nums.count - 1
    while start <= end {
        while start <= end && nums[start] < k {
            start += 1
        }
        while start <= end && nums[end] >= k {
            end -= 1
        }
        if start <= end {
            let tmp = nums[start]
            nums[start] = nums[end]
            nums[end] = tmp
            
            start += 1
            end -= 1
        }
    }
    //two cases, one [end, X, start], one [end, start], return start
    return start
}
