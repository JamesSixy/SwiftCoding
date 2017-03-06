
import UIKit
import ZHDataStructure

/// Search Graph Nodes
/// http://www.lintcode.com/en/problem/search-graph-nodes/
/// - Parameters:
///   - dict: <#dict description#>
///   - node: <#node description#>
///   - target: <#target description#>
/// - Returns: <#return value description#>

func searchNode(_ dict: [UndirectedGraphNode : Int],
                _ node: UndirectedGraphNode?,
                _ target: Int) -> UndirectedGraphNode? {
    guard let node = node else { return nil }
    var queue: [UndirectedGraphNode] = []
    var visited = Set<UndirectedGraphNode>()
    
    queue.append(node)//enqueue
    visited.insert(node)
    
    while !queue.isEmpty {
        let cur = queue.removeFirst() //dequeue
        if cur.label == target {
            return cur
        }
        for neighbor in cur.neighbors {
            if !visited.contains(neighbor) {
                queue.append(neighbor)
                visited.insert(neighbor)
            }
        }
    }
    return nil
}