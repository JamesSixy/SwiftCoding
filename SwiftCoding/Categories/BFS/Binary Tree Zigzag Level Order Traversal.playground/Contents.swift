
import ZHDataStructure

/**
 103. Binary Tree Zigzag Level Order Traversal
 Category: [BFS]
 
 Question: Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its zigzag level order traversal as:
 [
 [3],
 [20,9],
 [15,7]
 ]
 
 Link: https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/?tab=Description
 
 Idea: use a queue and a flag, level traversal
 
 Time: O(n), Space: O(n)
 
 */

//insertAtZero if odd
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else { return res }
    var queue = [root], isOdd = true
    while !queue.isEmpty {
        let size = queue.count
        var level = [Int]()
        for _ in 0 ..< size {
            let cur = queue.removeFirst()
            isOdd ? level.append(cur.val) : level.insert(cur.val, at: 0)
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        res.append(level)
        isOdd = !isOdd
    }
    return res
}


//reverse levelArray if odd
func zigzagLevelOrder2(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else { return res }
    
    var queue = [root]
    var flag = false
    while !queue.isEmpty {
        let size = queue.count
        var arr: [Int] = []
        for _ in 0 ..< size {
            let cur = queue.removeFirst()
            arr.append(cur.val)
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        let shouldReverse = flag
        flag = !flag
        res.append(shouldReverse ? arr.reversed() : arr)
    }
    return res
}









