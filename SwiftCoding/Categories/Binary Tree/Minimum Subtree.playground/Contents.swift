
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

typealias DCTuple = (minNode: TreeNode?, minSum: Int, sum: Int)

func findSubtreeDC(_ root: TreeNode?) -> TreeNode? {
    return helperDC(root).minNode
}

private func helperDC(_ root: TreeNode?) -> DCTuple {
    guard let root = root else {
        return (nil, Int.max, 0)
    }
    var left = helperDC(root.left)
    var right = helperDC(root.right)
    
    let sum = left.sum + right.sum + root.val
    if sum < left.minSum && sum < right.minSum {
        return (root, sum, sum)
    } else if left.minSum < right.minSum {
        left.sum = sum
        return left
    } else {
        right.sum = sum
        return right
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
