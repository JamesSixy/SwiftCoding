
/// 207. Course Schedule
/// https://leetcode.com/problems/course-schedule/?tab=Description
/// - Parameters:
///   - numCourses: <#numCourses description#>
///   - prerequisites: <#prerequisites description#>
/// - Returns: <#return value description#>

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {

    var indegree = getInDegree(numCourses, prerequisites)
    let edges = getEdges(numCourses, prerequisites)

    var queue = indegree.enumerated().filter {
        $0.element == 0
        }.map { $0.offset }
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

private func getInDegree(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var res = Array(repeatElement(0, count: numCourses))
    for i in 0 ..< prerequisites.count {
        let course = prerequisites[i][0]
        res[course] += 1
    }
    return res
}

private func getEdges(_ numCourses: Int, _ prerequisites: [[Int]]) -> [[Int]] {
    var res = Array(repeatElement([Int](), count: numCourses))
    for i in 0 ..< prerequisites.count {
        let neighbor = prerequisites[i][1]
        res[neighbor].append(prerequisites[i][0])
    }
    return res
}

let testCases = [
    (2, []),
    (2, [[0, 1]])
]
//** TEST
//for tuple in testCases {
//    print(canFinish(tuple.0, tuple.1))
//}

//func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
//    
//}
