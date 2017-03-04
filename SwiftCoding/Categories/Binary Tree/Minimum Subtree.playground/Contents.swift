
import ZHDataStructure

/// Minimum Subtree
/// http://www.lintcode.com/en/problem/minimum-subtree/
/// - Parameter root:
/// - Returns: root of min subtree

typealias Tuple = (minNode: TreeNode?, sum: Int)

var lastMinTuple: Tuple?

//Solution1: Traverse+D&C
func findSubtree(_ root: TreeNode?) -> TreeNode? {
    helper(root)
    guard let lastMinTuple = lastMinTuple else { return nil }
    return lastMinTuple.minNode
}

private func helper(_ root: TreeNode?) -> Tuple {
    guard let root = root else {
        return (nil, 0)
    }
    let left = helper(root.left)
    let right = helper(root.right)
    let sum = root.val + left.sum + right.sum
    if lastMinTuple == nil || sum < lastMinTuple!.sum {
        lastMinTuple = (root, sum)
    }
    return (root, sum)
}

//Solution2: D&C

typealias FindSubtreeTuple = (minRoot: TreeNode?, minSum: Int, allSum: Int)

func findSubtreeDC(_ root: TreeNode?) -> TreeNode? {
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

//Test
//let testData = [
//    [1, -5, 2, 0, 2, -4, -5],
//    [1, 2, -10],
//    [6],
//    [4, -3],
//    [2, 4, -9]
//]
//for arr in testData {
//    let root = arrayToBinaryTree(arr, 0)
//    print(preorderTraversal(root))
//    print(findSubtree(root)!.val)
//    lastMinTuple = nil
//    
//    print(findSubtreeDC(root)!.val)
//}





