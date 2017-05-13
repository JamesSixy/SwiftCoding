
import ZHDataStructure

/**
 Connected Component in Undirected Graph
 
 Category: [BFS]
 
 Question: Find the number connected component in the undirected graph. Each node in the graph contains a label and a list of its neighbors. (a connected component (or just component) of an undirected graph is a subgraph in which any two vertices are connected to each other by paths, and which is connected to no additional vertices in the supergraph.)
 
 Notice
 Each connected component should sort by label.
 
 Example
 Given graph:
 
 A-----B   C
 \     |   |
  \    |   |
   \   |   |
    \  |   |
      D    E
 Return {A,B,D}, {C,E}. Since there are two connected component which is {A,B,D}, {C,E}
 
 Link: http://www.lintcode.com/en/problem/connected-component-in-undirected-graph/
 
 Time: O(n), Space: O(n)
 
 */

func connectedSet(_ nodes: [UndirectedGraphNode]) -> [[Int]] {
    var res: [[Int]] = []
    guard nodes.count > 0 else { return res }
    var visited = Set<UndirectedGraphNode>()
    for node in nodes {
        guard !visited.contains(node) else { continue }
        ccBFS(node, visited, &res)
    }
    return res
}

private func ccBFS(_ node: UndirectedGraphNode,
                   _ visited: Set<UndirectedGraphNode>,
                   _ res: inout [[Int]]) {
    var queue = [node], component = [Int]()
    visited.insert(node)

    while !queue.isEmpty {
        let cur = queue.removeFirst()
        component.append(cur.label)
        for neighbor in cur.neighbors {
            if !visited.contains(neighbor) {
                queue.append(neighbor)
                visited.insert(neighbor)
            }
        }
    }
    res.append(component.sorted())
}





