
import ZHDataStructure

/**
 297. Serialize and Deserialize Binary Tree
 Category: [<#Description#>]
 
 Question: <#Description#>
 
 Link: https://leetcode.com/problems/serialize-and-deserialize-binary-tree/#/description
 Solution:http://www.jiuzhang.com/solutions/binary-tree-serialization/
 
 Idea:
 
 Serialize
 Time: <#Description#>, Space: <#Description#>
 
 Deserialize
 Time: <#Description#>, Space: <#Description#>
 
 */

func serializeLevel(_ root: TreeNode?) -> String {
    if root == nil { return "null" }
    var res = ""
    var queue = [root]
    while !queue.isEmpty {
        if let cur = queue.removeFirst() {
            res = res + String(cur.val) + ","
            queue.append(cur.left)
            queue.append(cur.right)
        } else {
            res += "null,"
        }
    }
    res.characters.removeLast()
    return res
}


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
    print(serializeLevel(node))
}



func deserialize(_ data: String) -> TreeNode? {
    guard data.characters.count > 0 else { return nil }
    let strs = data.characters.split{ $0 == "," }.map(String.init)
    
    let root = TreeNode(Int(strs[0])!)
    var queue: [TreeNode?] = [root]
    
    var i = 1
    while !queue.isEmpty {
        guard let cur = queue.removeFirst() else { continue } //dequeue
        //left
        if strs[i] == "null" {
            cur.left = nil
            queue.append(nil)
        } else {
            cur.left = TreeNode(Int(strs[i])!)
            queue.append(cur.left)
        }
        i += 1
        
        //right
        if strs[i] == "null" {
            cur.right = nil
            queue.append(nil)
        } else {
            cur.right = TreeNode(Int(strs[i])!)
            queue.append(cur.right)
        }
        i += 1
    }
    return root
}
