
import ZHDataStructure

/// 133. Clone Graph
/// https://leetcode.com/problems/clone-graph/?tab=Description
/// - Parameter node: <#node description#>
/// - Returns: cloned
/// 1.clone nodes 2.clone edges

func cloneGraph(_ node: UndirectedGraphNode) -> UndirectedGraphNode {
    let dict = cloneNodesDict(node)
    
    for (old, new) in dict {
        for neighbor in old.neighbors {
            new.neighbors.append(dict[neighbor]!)
        }
    }
    return dict[node]!
}

private func cloneNodesDict(_ node: UndirectedGraphNode) -> [UndirectedGraphNode : UndirectedGraphNode] {
    var dict = [UndirectedGraphNode : UndirectedGraphNode]()
    
    var queue = [node], visited = Set<UndirectedGraphNode>()
    visited.insert(node)
    
    while !queue.isEmpty {
        let cur = queue.removeFirst() // dequeue O(n)
        dict[cur] = UndirectedGraphNode(cur.label)
        for neighbor in cur.neighbors {
            if !visited.contains(neighbor) {
                queue.append(neighbor) // enqueue O(1)
                visited.insert(neighbor)
            }
        }
    }
    return dict
}