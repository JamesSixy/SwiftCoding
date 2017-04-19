
import ZHDataStructure
import UIKit

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    let edges = initEdges(numCourses ,prerequisites)
    let indegree = initIndegree(numCourses, prerequisites)
    
    var queue: [Int] = []
    for (i, ele) in indegree.enumerated() where ele == 0 {
        queue.append(i)
    }
    
    var count = 0
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        count += 1
        for neighbor in edges[cur] {
            indegree[neighbor] -= 1
            if indegree[neighbor] == 0 {
                queue.append(neighbor)
            }
        }
    }
    return count == numCourses
}

private func initEdges(_ numCourses: Int, _ prerequisites: [[Int]]) -> [[Int]] {
    var edges: [[Int]] = Array(repeating: Array(repeatElement(0, count: 2)), count: prerequisites.count)
    
    for (i, ele) in prerequisites.enumerated() {
        let node = ele[1]
        edges[node].append(ele[0])
    }
    return edges
}

private func initIndegree(_ numCourses: Int, _ prerequisites: [Int]) -> [Int] {
    var res = Array(repeating: 0, count: numCourses)
    for (i, ele) in prerequisites.enumerated() {
        let indegreeNode = ele[0]
        res[indegreeNode] += 1
    }
    return res
}