
import ZHDataStructure

/// Topological Sorting
/// http://www.lintcode.com/en/problem/topological-sorting/
/// - Parameter graph: <#graph description#>
/// - Returns: Find any topological order for the given graph.
func topSort(_ graph: [DirectedGraphNode]) -> [DirectedGraphNode] {

    var res = [DirectedGraphNode]()
    var dict = getIndegreeNodes(graph)
    var queue = graph.filter {
        dict[$0] == nil
    }
    res += queue
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for neighbor in cur.neighbors {
            dict[neighbor]! -= 1
            if dict[neighbor]! == 0 {
                res.append(neighbor)
                queue.append(neighbor)
            }
        }
    }
    return res
}

private func getIndegreeNodes(_ graph: [DirectedGraphNode]) -> [DirectedGraphNode : Int] {
    var dict = [DirectedGraphNode : Int]()
    for node in graph {
        for neighbor in node.neighbors {
            if var _ = dict[neighbor] {
                dict[neighbor]! += 1
            } else {
                dict[neighbor] = 1
            }
        }
    }
    return dict
}

//TODO test, code might be wrong
