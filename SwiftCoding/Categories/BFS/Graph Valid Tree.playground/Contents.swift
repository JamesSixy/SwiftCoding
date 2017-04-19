
/**
 261. Graph Valid Tree
 Category: [BFS]
 
 Question: Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.
 
 For example:
 
 Given n = 5 and edges = [[0, 1], [0, 2], [0, 3], [1, 4]], return true.
 
 Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]], return false.
 
 Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
 
 Link: https://leetcode.com/problems/graph-valid-tree/?tab=Description
 
 Idea: construct edges dict<Node: Neighbors>-- [Int: [Int]] or [Int: Set<Int>] and BFS
 
 How would you construct a graph given numOfNodes and edges?
 
 Time: O(n), Space: O(n)
 
 */

//dict -> [Int : Set<Int>]
func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    guard n == edges.count + 1 && n > 0 else { return false }
    let dict = initGraph(n, edges)
    var queue = [0], count = 0, visited = Set<Int>()
    visited.insert(0)
    while !queue.isEmpty {
        let cur = queue.removeFirst() //dequeue O(n)
        count += 1
        guard let neighbors = dict[cur] else { break }
        for neighbor in neighbors {
            if !visited.contains(neighbor) {
                queue.append(neighbor) //enqueue O(1)
                visited.insert(neighbor)
            }
        }
    }
    return count == n
}

private func initGraph(_ n: Int, _ edges: [[Int]]) -> [Int : Set<Int>] {
    var dict = [Int : Set<Int>]()
    //add nodes
    for i in 0 ..< n {
        dict[i] = Set<Int>()
    }
    //add edges
    for edge in edges {
        let first = edge[0]
        let last = edge[1]
        dict[first]?.insert(last)//be aware of dict is struct
        dict[last]?.insert(first)
    }
    return dict
}

//dict -> [Int: [Int]]
func validTree2(_ n: Int, _ edges: [[Int]]) -> Bool {
    guard n > 0, n == edges.count + 1 else { return false }
    let dict = getValidTreeMapping(n, edges)
    var queue = [0], visited = Set<Int>()
    visited.insert(0)
    var count = 0
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        count += 1
        guard let neighbors = dict[cur] else { break }
        for neighbor in neighbors {
            if !visited.contains(neighbor) {
                queue.append(neighbor)
                visited.insert(neighbor)
            }
        }
    }
    return n == count
}

private func getValidTreeMapping(_ n: Int, _ edges: [[Int]]) -> [Int: [Int]] {
    var dict: [Int: [Int]] = [:]
    for i in 0 ..< n {
        dict[i] = [Int]()
    }
    for ele in edges {
        let firstNode = ele[0]
        let secondNode = ele[1]
        dict[firstNode]?.append(secondNode)
        dict[secondNode]?.append(firstNode)
    }
    return dict
}
