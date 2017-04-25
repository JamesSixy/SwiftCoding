
import ZHDataStructure
import UIKit

/**
 156. Binary Tree Upside Down
 
 Link: https://leetcode.com/problems/binary-tree-upside-down/#/description
 
 Category: [<#Description#>]
 
 Question: Given a binary tree where all the right nodes are either leaf nodes with a sibling (a left node that shares the same parent node) or empty, flip it upside down and turn it into a tree where the original right nodes turned into left leaf nodes. Return the new root.
 
 For example:
 Given a binary tree {1,2,3,4,5},
 1
 / \
 2   3
 / \
 4   5
 return the root of the binary tree [4,5,2,#,#,3,1].
 4
 / \
 5   2
 / \
 3   1
 
 Idea: <#Description#>
 
 Time: O(<#Description#>), Space: O(<#Description#>)
 
 */

func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
    var parent: TreeNode?
    var node: TreeNode? = root
    var right: TreeNode?
    
    while node != nil {
        let left = node!.left
        node!.left = right
        right = node!.right
        node!.right = parent
        parent = node
        node = left
    }
    
    return parent
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






