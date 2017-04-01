
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
            swap(&num, start, end)
        }
    }
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

private func swap<T>(_ nums: inout [T], _ i: Int, _ j: Int) {
    (nums[i], nums[j]) = (nums[j], nums[i])
}

//let testCase = [
//    ([5,4,6,2],1),
//    ([3,1,2,3,3,3],1),
//    ([8,4,8,9,5],5)
//]
//
//for tuple in testCase {
//    print(tuple.0)
////    print(partitionArray(tuple.0, tuple.1))
//    var arr = tuple.0
//    print(partitionArrayForQS(&arr, 0, tuple.0.count - 1))
//    print("after - \(arr)")
//    print()
//}
