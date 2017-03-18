
import ZHDataStructure

///
///
/// - Parameters:
///   - root: <#root description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>


/**
 Binary Tree Path Sum
 Category: [DFS]
 
 Question: Given a binary tree, find all paths that sum of the nodes in the path equals to a given number target.
 
 A valid path is from root node to any of the leaf nodes.
 
 Link: http://www.lintcode.com/en/problem/binary-tree-path-sum/
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: O(n), Space: O(n)
 
 */

// it's still a DFS question, although you only have left right for recursion. Must remove left and right node
func binaryTreePathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else { return res }
    var container: [Int] = [root.val]
    helper(root, target, &res, &container)
    return res
}

func helper(_ root: TreeNode,
            _ target: Int,
            _ res: inout [[Int]],
            _ container: inout [Int]) {

    if root.left == nil && root.right == nil {
        if target - root.val == 0 {
            res.append(container)
        }
        return
    }
    
    if let left = root.left {
        container.append(left.val)
        helper(left, target - root.val, &res, &container)
        container.removeLast()
    }
    if let right = root.right {
        container.append(right.val)
        helper(right, target - root.val, &res, &container)
        container.removeLast()
    }
}

//let testData = [
//    ([1, 2, 4, 2, 3], 5), //[1, 2, 2], [1, 4]
//    ([1, 2, 1], 2), //[1, 1]
//]
//for arr in testData {
//    let root = arrayToBinaryTree(arr.0, 0)
//    print(preorderTraversal(root))
//    print(binaryTreePathSum(root, arr.1))
//}
