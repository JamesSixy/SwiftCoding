
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

/// Subtree with Maximum Average
/// http://www.lintcode.com/en/problem/subtree-with-maximum-average/#
/// - Parameter root:
/// - Returns: max average root of subtree

typealias Tuple = (sum: Int, node: TreeNode?, size: Int)

var lastTuple: Tuple? = nil

func findSubtree2(_ root: TreeNode?) -> TreeNode? {
    helper(root)
    guard let lastTriple = lastTuple else { return nil }
    return lastTriple.1
}

private func helper(_ root: TreeNode?) -> Tuple {
    guard let root = root else {
        return (0, nil, 0)
    }
    let left = helper(root.left)
    let right = helper(root.right)
    
    let sum = left.sum + right.sum + root.val
    let size = left.size + right.size + 1
    let rootTriple: Tuple = (sum, root, size)

    if lastTuple == nil || sum * lastTuple!.size > size * lastTuple!.sum {
        lastTuple = rootTriple
    }
    return rootTriple
}

//TODO come back and test
