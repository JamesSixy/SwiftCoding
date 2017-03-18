
import ZHDataStructure
import UIKit

/**
 226. Invert Binary Tree
 Category: [<#Description#>]
 
 Question: Invert a binary tree.
 
 Link: https://leetcode.com/problems/invert-binary-tree/#/description

 Time: O(n), Space: O(n)
 
 */

func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    (root.left, root.right) = (root.right, root.left)
    invertTree(root.left)
    invertTree(root.right)
    return root
}





