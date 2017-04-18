
import ZHDataStructure

/**
 133. Clone Graph
 Category: [BFS]
 
 Question: Clone an undirected graph. Each node in the graph contains a label and a list of its neighbors.
 
 Link: https://leetcode.com/problems/clone-graph/?tab=Description
 
 Idea: 1.clone nodes 2.clone edges
 
 Time: O(n), Space: O(n)
 
 */

func cloneGraph(_ node: UndirectedGraphNode) -> UndirectedGraphNode {
    let dict = cloneNodesDict(node)
    
    for (cur, copy) in dict {
        for neighbor in cur.neighbors {
            copy.neighbors.append(dict[neighbor]!)
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
