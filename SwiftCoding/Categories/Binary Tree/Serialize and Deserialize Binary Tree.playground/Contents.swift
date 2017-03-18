
import ZHDataStructure

/**
 297. Serialize and Deserialize Binary Tree
 Category: [<#Description#>]
 
 Question: <#Description#>
 
 Link: https://leetcode.com/problems/serialize-and-deserialize-binary-tree/#/description
 Solution:
 Return: <#Description#>
 
 Idea:
 
 Serialize
 Time: <#Description#>, Space: <#Description#>
 
 Deserialize
 Time: <#Description#>, Space: <#Description#>
 
 */

func serialize(_ root: TreeNode?) -> String {
    guard let root = root else { return "null" }
    var res = ""
    res += "\(root.val)"
    let left = serialize(root.left)
    let right = serialize(root.right)
    res += ", \(left), \(right)"
    return res
}

let root = arrayToBinaryTree([1, 2, 3, 4, 5, 6, 7], 0)
print(preorderTraversal(root))
print(inorderTraversal(root))
print(postorderTraversal(root))


let testCases = [
    arrayToBinaryTree([1, 2, 3, 4, 5, 6, 7], 0)
]
for node in testCases {
    print(serialize(node))
}



//func deserialize(_ data: String) -> TreeNode? {
//    
//}
