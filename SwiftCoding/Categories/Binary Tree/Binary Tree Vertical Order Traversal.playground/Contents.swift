
import ZHDataStructure

/**
 314. Binary Tree Vertical Order Traversal
 Category: []
 
 Question: Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).
 If two nodes are in the same row and column, the order should be from left to right.
 
 Link: https://leetcode.com/problems/binary-tree-vertical-order-traversal/?tab=Description
 
 Use two queues, one holds TreeNode and one holds column level, and a dictionary to map column with its correspond TreeNode vals
 
 Time: O(n), Space: O(n)
 
 */

func verticalOrder(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else { return res }
    var queue: [TreeNode] = [], cols: [Int] = [], dict: [Int : [Int]] = [:]
    
    queue.append(root)
    cols.append(0)
    
    var minCol = 0, maxCol = 0
    
    while !queue.isEmpty {
        let cur = queue.removeFirst() //dequeue
        let col = cols.removeFirst()
        
        dict[col] = dict[col] ?? []
        dict[col]!.append(cur.val)
        
        if let left = cur.left {
            queue.append(left)
            cols.append(col - 1)
            minCol = min(minCol, col - 1)
        }
        if let right = cur.right {
            queue.append(right)
            cols.append(col + 1)
            maxCol = max(maxCol, col + 1)
        }
    }
    
    for i in minCol ... maxCol {
        guard let list = dict[i] else { continue }
        res.append(list)
    }
    return res
}
