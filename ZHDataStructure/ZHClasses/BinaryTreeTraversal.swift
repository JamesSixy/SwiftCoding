
/*
 TreeNode
 */
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

public class DoublyListNode {
    public var val: Int
    public var next: DoublyListNode?, prev: DoublyListNode?
    public init(_ val: Int) {
        self.val = val
    }
}

/*
 Preorder Traversal (Iterative
 */
public func preorderTraversal(_ root: TreeNode?) -> [Int] {
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
 Inorder Traversal (Iterative
 */
public func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    var stack = Stack<TreeNode>()
    var cur = root
    while !stack.isEmpty || cur != nil {
        while cur != nil {
            stack.push(cur!)
            cur = cur!.left
        }
        cur = stack.pop()
        res.append(cur!.val)
        cur = cur!.right
    }
    return res
}

/*
 Postorder Traversal (Iterative)
 */
public func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    guard let root = root else {
        return res
    }
    var stack = Stack<TreeNode>()
    var reverse = Stack<Int>()
    stack.push(root)
    while !stack.isEmpty {
        let cur = stack.pop()!
        reverse.push(cur.val)
        if let left = cur.left {//left first
            stack.push(left)
        }
        if let right = cur.right {
            stack.push(right)
        }
    }
    while !reverse.isEmpty {
        res.append(reverse.pop()!)
    }
    return res
}

/*
 Helper
 Convert Array to Binary Tree (from left to right)
 */
public func arrayToBinaryTree(_ nums: [Int], _ pos: Int) -> TreeNode? {
    guard nums.count > 0, pos < nums.count else {
        return nil
    }
    let root = TreeNode(nums[pos])
    root.left = arrayToBinaryTree(nums, 2 * pos + 1)
    root.right = arrayToBinaryTree(nums, 2 * pos + 2)
    return root
}

//let root = arrayToBinaryTree([1, 2, 3, 4, 5, 6, 7], 0)
//print(preorderTraversal(root))
//print(inorderTraversal(root))
//print(postorderTraversal(root))
