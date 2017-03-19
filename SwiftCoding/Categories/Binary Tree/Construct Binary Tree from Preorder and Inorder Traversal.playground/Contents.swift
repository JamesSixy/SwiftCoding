
import ZHDataStructure
import UIKit

/**
 Construct Binary Tree from Preorder and Inorder Traversal
 Category: [<#Description#>]
 
 Question: Given preorder and inorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 Link: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
 
 Idea: Always use the first element in preorder as root, then find that one in inorder to get left and right subtrees
 
 Time: O(n), Space: O(n)
 
 */

func buildTree(preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard preorder.count > 0 && inorder.count > 0 && preorder.count == inorder.count else {
        return nil
    }
    
    return _buildHelper(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
}

private func _buildHelper(preorder: [Int], _ preStart: Int, _ preEnd: Int, _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
    guard preStart <= preEnd && inStart <= inEnd else {
        return nil
    }
    
    let root = TreeNode(preorder[preStart])
    
    var mid = 0
    for i in inStart ... inEnd {
        if inorder[i] == preorder[preStart] {
            mid = i
            break
        }
    }
    
    root.left = _buildHelper(preorder, preStart + 1, preStart + mid - inStart, inorder, inStart, mid - 1)
    root.right = _buildHelper(preorder, preStart + mid - inStart + 1, preEnd, inorder, mid + 1, inEnd)
    
    return root
}


/**
 TestCases: <#Description#>
 */
let testCases = [
    <#Description#>
]

for <#Description#> in testCases {
    print(<#Description#>)
}






