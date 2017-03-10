
//Binary Search
public func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return -1 }
    var start = 0, end = nums.count - 1
    while start + 1 < end {
        let mid = start + (end + start) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            end = mid
        } else {
            start = mid
        }
    }
    if nums[start] == target {
        return start
    } else if nums[end] == target {
        return end
    } else {
        return -1
    }
}
