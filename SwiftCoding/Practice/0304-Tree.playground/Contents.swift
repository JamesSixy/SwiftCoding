
import UIKit
import ZHDataStructure

typealias FindSubtreeTuple = (minRoot: TreeNode?, minSum: Int, allSum: Int)

func findSubtree(_ root: TreeNode?) -> TreeNode? {
    return minSubHelper(root).minRoot
}

private func minSubHelper(_ root: TreeNode?) -> FindSubtreeTuple {
    guard let root = root else {
        return (nil, Int.max, 0)
    }
    let left = minSubHelper(root.left)
    let right = minSubHelper(root.right)
    
    let sum = left.allSum + right.allSum + root.val
    
    if sum < left.minSum && sum < right.minSum {
        return (root, sum, sum)
    } else if left.minSum < right.minSum {
        return (left.minRoot, left.minSum, sum)
    } else {
        return (right.minRoot, right.minSum, sum)
    }
}