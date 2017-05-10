
import UIKit
import ZHDataStructure

func bfs(_ root: TreeNode?) -> [[Int]] {
    var res: [[Int]] = []
    guard let root = root else { return res }
    
    var queue = [root]
    
    while !queue.isEmpty {
        let size = queue.count
        var arr = [Int]()
        for _ in 0..<size {
            
            let cur = queue.removeFirst()
            arr.append(cur.val)
            
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        res.append(arr)
    }
    return res
}


func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {

}



