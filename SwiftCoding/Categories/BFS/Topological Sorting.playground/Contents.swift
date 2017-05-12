
import ZHDataStructure

/**
 Topological Sorting
 
 Category: [BFS]
 
 Question: Given an directed graph, a topological order of the graph nodes is defined as follow:
 
 For each directed edge A -> B in graph, A must before B in the order list.
 The first node in the order can be any node in the graph with no nodes direct to it.
 Find any topological order for the given graph.
 
 Notice
 
 You can assume that there is at least one topological order in the graph.
 
 Link: http://www.lintcode.com/en/problem/topological-sorting/
 
 Time: O(n), Space: O(n)
 
 */

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
