
/// 261. Graph Valid Tree
/// https://leetcode.com/problems/graph-valid-tree/?tab=Description
/// - Parameters:
///   - n: <#n description#>
///   - edges: <#edges description#>
/// - Returns: bool
/// How would you construct a graph given numOfNodes and edges?

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
