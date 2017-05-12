
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

func topSort(_ graph: [DirectedGraphNode]) -> [DirectedGraphNode] {
    let dict = getIndegreeDict(graph)
    
}

private func getIndegreeDict(_ graph: [DirectedGraphNode]) -> [DirectedGraphNode: Int] {
    let dict = [DirectedGraphNode: Int]()
    var queue = [graph[0]]
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for neighbor in cur.neighbors {
            if dict[neighbor] == nil {
                dict[neighbor] = 1
            } else {
                dict[neighbor] = dict[neighbor] + 1
            }
            
            queue.append(neighbor)
        }
    }
    return dict
}



