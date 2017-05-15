
import ZHDataStructure
import UIKit


/**
 133. Clone Graph
 Category: [BFS]
 
 Question: Clone an undirected graph. Each node in the graph contains a label and a list of its neighbors.
 
 Link: https://leetcode.com/problems/clone-graph/?tab=Description
 
 Idea: 1.clone nodes 2.clone edges
 
 Time: O(n), Space: O(n)
 
 */

func cloneGraph(_ node: UndirectedGraphNode) -> UndirectedGraphNode {
    let dict = copyNodes(node)
    for cur in dict.keys {
        let copy = dict[cur]!
        for neighbor in cur.neighbors {
            copy.neighbors.append(dict[neighbor]!)
        }
    }
    return dict[node]!
}

private func copyNodes(_ node: UndirectedGraphNode) -> [UndirectedGraphNode: UndirectedGraphNode] {
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