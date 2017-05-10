
import UIKit
import ZHDataStructure




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



