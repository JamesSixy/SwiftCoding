
import ZHDataStructure

/**
 Convert Binary Tree to Linked Lists by Depth
 Category: [DFS]
 
 Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
 
 Link: http://www.lintcode.com/en/problem/convert-binary-tree-to-linked-lists-by-depth/
 Solution: http://www.jiuzhang.com/solutions/convert-binary-tree-to-linked-lists-by-depth/
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: O(n), Space: O(n)
 
 */

func binaryTreeToLists(_ root: TreeNode?) -> [ListNode] {
    var res = [ListNode]()
    binaryTreeToListsDFS(root, 1, &res)
    return res
}

private func binaryTreeToListsDFS(_ root: TreeNode?,
                                  _ depth: Int,
                                  _ res: inout [ListNode]) {
    guard let root = root else { return }
    let node = ListNode(root.val)
    if res.count < depth {
        res.append(node)
    } else {
        node.next = res[depth - 1]
        res[depth - 1] = node
    }
    binaryTreeToListsDFS(root.right, depth + 1, &res)
    binaryTreeToListsDFS(root.left, depth + 1, &res)
}

let testData = [
    [1, 2, 3, 4, 5, 6, 7, 8, 9],
]
for arr in testData {
    let root = arrayToBinaryTree(arr, 0)
    for node in binaryTreeToLists(root) {
        var node: ListNode? = node
        var str = ""
        while node != nil {
            str = str + "\(node!.val)->"
            node = node?.next
        }
        str.append("null")
        print(str)
    }
}



