
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

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


//Test
var node0 = TreeNode(1)
var node1 = TreeNode(-5)
var node2 = TreeNode(2)
var node3 = TreeNode(0)
var node4 = TreeNode(2)
var node5 = TreeNode(-4)
var node6 = TreeNode(-5)


