
public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

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

/*
 Preorder Traversal (Iterative
 */
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    guard let root = root else {
        return res
    }
    var stack = Stack<TreeNode>()
    stack.push(root)
    
    while !stack.isEmpty {
        let cur = stack.pop()!
        res.append(cur.val)
        if let right = cur.right {
            stack.push(right)
        }
        if let left = cur.left {
            stack.push(left)
        }
    }
    return res
}

/*
 Helper
 Convert Array to Binary Tree (from left to right)
 */
func arrayToBinaryTree(_ nums: [Int], _ pos: Int) -> TreeNode? {
    guard nums.count > 0, pos < nums.count else {
        return nil
    }
    let root = TreeNode(nums[pos])
    root.left = arrayToBinaryTree(nums, 2 * pos + 1)
    root.right = arrayToBinaryTree(nums, 2 * pos + 2)
    return root
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


arrayToBinaryTree([1, 2, 3, 4, 5, 6, 7], 0)

