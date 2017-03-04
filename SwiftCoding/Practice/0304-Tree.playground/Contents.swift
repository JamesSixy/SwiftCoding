
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

typealias LongestConsecutiveTuple = (maxLen: Int, maxFromRoot: Int)

func longestConsecutive(_ root: TreeNode?) -> Int {
    return longestConsecutiveHelper(root).maxLen
}

private func longestConsecutiveHelper(_ root: TreeNode?) -> LongestConsecutiveTuple {
    guard let root = root else {
        return (0, 0)
    }
    let left = longestConsecutiveHelper(root.left)
    let right = longestConsecutiveHelper(root.right)
    
    var maxFromRoot = 1
    if let leftNode = root.left, root.val + 1 == leftNode.val {
        maxFromRoot = max(maxFromRoot, left.maxFromRoot + 1)
    }
    if let rightNode = root.right, root.val + 1 == rightNode.val {
        maxFromRoot = max(maxFromRoot, right.maxFromRoot + 1)
    }
    return (max(left.maxLen, right.maxLen, maxFromRoot), maxFromRoot)
}

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    guard let root = root else { return [] }
    let left = binaryTreePaths(root.left)
    let right = binaryTreePaths(root.right)
    var res = [String]()
    for path in left {
        res.append(String(root.val) + "->" + path)
    }
    for path in right {
        res.append(String(root.val) + "->" + path)
    }
    if left.count == 0 && right.count == 0 {
        res.append(String(root.val))
    }
    return res
}
