
//import ZHDataStructure

//enum Numbers: String {
//    case Zero = "0"
//    case One = "1"
//}

typealias Point = (x: Int, y: Int)
//
//func numIslands(_ grid: [[Character]]) -> Int {
//    guard grid.count > 0 else { return 0 }
//    var res = 0, grid = grid
//    for (i, row) in grid.enumerated() {
//        for (j, _) in row.enumerated() {
//            if grid[i][j] == "1" {
//                res += 1
//                nlBFS(&grid, i, j)
//            }
//        }
//    }
//    return res
//}
//
//private func nlBFS(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
//    let root: Point = (i, j)
//    var queue = [root]
//    grid[i][j] = "0"
//    let dx = [0, 0, 1, -1]
//    let dy = [1, -1, 0, 0]
//    while !queue.isEmpty {
//        let cur = queue.removeFirst() //dequeue
//        for k in 0 ..< 4 {
//            let nx = dx[k] + cur.x, ny = dy[k] + cur.y
//            if nlIsValid(grid, nx, ny) {
//                queue.append((nx, ny)) //enqueue
//                grid[nx][ny] = "0"
//            }
//        }
//    }
//}

//private func nlIsValid(_ grid: [[Character]], _ i: Int, _ j: Int) -> Bool {
//    return i >= 0 && i < grid.count && j >= 0 && j < grid[0].count && grid[i][j] == "1"
//}
//
//func shortestPath(_ grid: [[Int]], source: Point, destination: Point) -> Int {
//    guard grid.count > 0 else { return -1 }
//    guard source != destination else { return 0 }
//    var steps = Array(repeating: Array(repeatElement(Int.max, count: grid[0].count)), count: grid.count)
//    var res = 0
//    var queue = [source]
//    steps[source.x][source.y] = 0
//    let dx = [1, 1, -1, -1, 2, 2, -2, -2]
//    let dy = [2, -2, 2, -2, 1, -1, 1, -1]
//    while !queue.isEmpty {
//        let size = queue.count
//        res += 1
//        for _ in 0 ..< size {
//            let cur = queue.removeFirst() //dequeue
//            if cur == destination {
//                return steps[cur.x][cur.y]
//            }
//            for k in 0 ..< 8 {
//                let nx = dx[k] + cur.x
//                let ny = dy[k] + cur.y
//                guard spIsValid(grid, steps, nx, ny) else { continue }
//                queue.append(Point(nx, ny))
//                steps[nx][ny] = res
//            }
//        }
//    }
//    return -1
//}
//
//private func spIsValid(_ grid: [[Int]], _ steps: [[Int]], _ i: Int, _ j: Int) -> Bool {
//    return i >= 0 && i < steps.count && j >= 0 && j < steps[0].count && steps[i][j] == Int.max && grid[i][j] == 0
//}
//
//let testCases = [
//    ([
//        [0,0,0],
//        [0,0,0],
//        [0,0,0]
//        ], Point(2, 0), Point(2, 2)),
//    ([
//        [0,1,0],
//        [0,0,0],
//        [0,0,0]
//        ], Point(2, 0), Point(2, 2)),
//    ([
//        [0,1,0],
//        [0,0,1],
//        [0,0,0]
//        ], Point(2, 0), Point(2, 2))
//]
//
//for tuple in testCases {
//    print(shortestPath(tuple.0, source: tuple.1, destination: tuple.2))
//}


//func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
//    guard n == edges.count + 1 && n > 0 else { return false }
//    let dict = initGraph(n, edges)
//    var queue = [0], res = 0, visited = Set<Int>()
//    visited.insert(0)
//    while !queue.isEmpty {
//        let cur = queue.removeFirst() //dequeue
//        res += 1
//        guard let neighbors = dict[cur] else { break }
//        for neighbor in neighbors {
//            if !visited.contains(neighbor) {
//                queue.append(neighbor) //enqueue
//                visited.insert(neighbor)
//            }
//        }
//    }
//    return res == n
//}
//
//private func initGraph(_ n: Int, _ edges: [[Int]]) -> [Int : Set<Int>] {
//    var dict = [Int : Set<Int>]()
//    //add nodes
//    for i in 0 ..< n {
//        dict[i] = Set<Int>()
//    }
//    //add edges
//    for edge in edges {
//        let first = edge[0]
//        let last = edge[1]
//        dict[first]?.insert(last)//be aware of dict is struct
//        dict[last]?.insert(first)
//    }
//    return dict
//}
