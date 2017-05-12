
import ZHDataStructure
import UIKit

func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    guard n > 0, edges.count == n - 1 else { return false }
    let edgesDict = getEdgesDict(n, edges)
    var queue = [0], count = 0
    var visited = Set<Int>()
    visited.insert(0)
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        count += 1
        guard let neighbors = edgesDict[cur] else { break }
        for neighbor in neighbors {
            if !visited.contains(neighbor) {
                queue.append(neighbor)
                visited.insert(neighbor)
            }
        }
    }
    return count == n
}

private func getEdgesDict(_ n: Int,
                          _ edges: [[Int]]) -> [Int: Set<Int>] {
    var dict = [Int: Set<Int>]()
    for i in 0 ..< n {
        dict[i] = Set<Int>()
    }
    for edge in edges {
        let node1 = edge[0]
        let node2 = edge[1]
        
        dict[node1]?.insert(node2)
        dict[node2]?.insert(node1)
    }
    return dict
}