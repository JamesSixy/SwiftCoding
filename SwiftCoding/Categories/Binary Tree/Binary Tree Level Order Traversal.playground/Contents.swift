
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

/// Binary Tree Level Order Traversal
/// https://leetcode.com/problems/binary-tree-level-order-traversal/?tab=Description
/// - Parameter root:
/// - Returns: [[Int]]
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else { return res }
    var queue: [TreeNode] = [] //use array to mock queue
    queue.append(root)
    while !queue.isEmpty {
        let size = queue.count
        var level: [Int] = []
        for _ in 0 ..< size {
            let cur = queue.removeFirst()
            level.append(cur.val)
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        res.append(level)
    }
    return res
}


//func arrayToBinaryTree(_ nums: [Int]) -> TreeNode? {
//    guard nums.count > 0 else { return nil }
//    let root = TreeNode(nums[0])
//    var queue: [TreeNode] = [root] //use array to mock queue
//    var dict: [TreeNode : Int] = [:]
//    dict[root] = 0
//    while !queue.isEmpty {
//        let size = queue.count
//        for _ in 0 ..< size {
//            let cur = queue.removeFirst()
//            let parentIndex = dict[cur]
//            let leftChildIndex = 2 * parentIndex + 1
//            let rightChildIndex = 2 * parentIndex + 2
//            
//            if leftChildIndex < nums.count {
//                let leftNode = TreeNode(nums[leftChildIndex])
//                cur.left = leftNode
//                queue.append(leftNode)
//            }
//            if rightChildIndex < nums.count {
//                let rightNode = TreeNode(nums[rightChildIndex])
//                cur.right = rightNode
//                queue.append(rightNode)
//            }
//        }
//    }
//    return root
//}


//arrayToBinaryTree([1, 2, 3, 4, 5, 6, 7])
