
import ZHDataStructure
import UIKit

func cloneGraph(_ node: UndirectedGraphNode) -> UndirectedGraphNode {
    let dict = nodesDict(node)
    
    for (node, copy) in dict {
        for neighbor in node {
            copy.neighbors.append(dict[neighbor]!)
        }
    }
    return dict[node]!
}

private func nodesDict(_ node: UndirectedGraphNode) -> [UndirectedGraphNode: UndirectedGraphNode] {
    var dict = [UndirectedGraphNode: UndirectedGraphNode]()
    var queue = [node]
    var visited = Set<UndirectedGraphNode>()
    visited.insert(node)
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        dict[cur] = UndirectedGraphNode(cur.label)
        for neighbor in cur.neighbors {
            if !visited.contains(neighbor) {
                queue.append(neighbor)
                visited.insert(neighbor)
            }
        }
    }
    return dict
}





