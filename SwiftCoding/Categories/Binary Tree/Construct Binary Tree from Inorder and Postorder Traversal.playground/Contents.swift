
import ZHDataStructure
import UIKit

/**
 106. Construct Binary Tree from Inorder and Postorder Traversal
 Category: [<#Description#>]
 
 Question: Given inorder and postorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree
 
 Link: https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/
 
 Idea: Always use the last element in postorder as root, then find that one in inorder to get left and right subtrees
 
 Time: O(n), Space: O(n)
 
 */

func buildTree(inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    guard inorder.count > 0 && postorder.count > 0 && inorder.count == postorder.count else {
        return nil
    }
    
    return buildHelper(inorder,
                       0,
                       inorder.count - 1,
                       postorder,
                       0,
                       postorder.count - 1)
}

private func buildHelper(inorder: [Int],
                          _ inStart: Int,
                          _ inEnd: Int,
                          _ postorder: [Int],
                          _ postStart: Int,
                          _ postEnd: Int) -> TreeNode? {
    guard inStart <= inEnd && postStart <= postEnd else {
        return nil
    }
    
    let root = TreeNode(postorder[postEnd])
    
    var mid = 0
    for i in inStart ... inEnd where inorder[i] == root.val {
        mid = i
        break
    }
    
    root.left = buildHelper(inorder,
                            inStart,
                            mid - 1,
                            postorder,
                            postStart,
                            mid - 1 - inStart + postStart)
    root.right = buildHelper(inorder,
                             mid + 1,
                             inEnd,
                             postorder,
                             mid - inStart + postStart,
                             postEnd - 1)
    
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






