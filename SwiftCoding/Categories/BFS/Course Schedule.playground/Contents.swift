
/**
 207. Course Schedule
 Category: [BFS]
 
 Question: There are a total of n courses you have to take, labeled from 0 to n - 1.
 
 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
 
 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?
 
 For example:
 
 2, [[1,0]]
 There are a total of 2 courses to take. To take course 1 you should have finished course 0. So it is possible.
 
 2, [[1,0],[0,1]]
 There are a total of 2 courses to take. To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
 
 Note:
 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 
 Link: https://leetcode.com/problems/course-schedule/?tab=Description
 
 Idea: Topology sort: 
    1.Build edges and indegreeCountsForEachNode
    2.topology BFS (first found all 0 degree node and then traverse)
    3.check if nodes == count.
    PS: prep[i][0] is neighbor of prep[i][1] and will be used to calculate indegree count, prep[i][1] is outdegree node and will be used to get its neighbors
 
 Time: O(n), Space: O(n)
 
 */

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    let edges = initEdges(numCourses ,prerequisites)
    var indegree = initIndegree(numCourses, prerequisites)
    
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
    var edges: [[Int]] = Array(repeating: [Int](), count: numCourses)
    
    for (i, ele) in prerequisites.enumerated() {
        let node = ele[1]
        edges[node].append(ele[0])
    }
    return edges
}

private func initIndegree(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var res = Array(repeating: 0, count: numCourses)
    for (i, ele) in prerequisites.enumerated() {
        let indegreeNode = ele[0]
        res[indegreeNode] += 1
    }
    return res
}

//old
func canFinish2(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

    var indegree = getInDegree(numCourses, prerequisites)
    let edges = getEdges(numCourses, prerequisites)
    
    var queue: [Int] = []
    for (i, ele) in indegree.enumerated() where ele == 0 {
        queue.append(i)
    }
//    var queue = indegree.enumerated().filter {
//        $0.element == 0
//        }.map { $0.offset }
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

private func initIndegree(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var res = Array(repeatElement(0, count: numCourses))
    for i in 0 ..< prerequisites.count {
        let course = prerequisites[i][0]
        res[course] += 1
    }
    return res
}

private func initEdges(_ numCourses: Int, _ prerequisites: [[Int]]) -> [[Int]] {
    var res = Array(repeatElement([Int](), count: numCourses))
    for i in 0 ..< prerequisites.count {
        let cur = prerequisites[i][1]
        res[cur].append(prerequisites[i][0])
    }
    return res
}

//** TEST
//let testCases = [
//    (2, []),
//    (2, [[0, 1]])
//]
//for tuple in testCases {
//    print(canFinish(tuple.0, tuple.1))
//}


/// 210. Course Schedule II
/// https://leetcode.com/problems/course-schedule-ii/?tab=Description
/// - Parameters:
///   - numCourses: <#numCourses description#>
///   - prerequisites: <#prerequisites description#>
/// - Returns: <#return value description#>

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var res: [Int] = Array(repeatElement(0, count: numCourses))
    var indegree = initIndegree(numCourses, prerequisites)
    let edges = initEdges(numCourses, prerequisites)
    
    var queue = indegree.enumerated().filter {
        $0.element == 0
        }.map { $0.offset }
    var count = 0
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        res[count] = cur
        count += 1
        for neighbor in edges[cur] {
            indegree[neighbor] -= 1
            if indegree[neighbor] == 0 {
                queue.append(neighbor)
            }
        }
    }
    return count == numCourses ? res : []
}
