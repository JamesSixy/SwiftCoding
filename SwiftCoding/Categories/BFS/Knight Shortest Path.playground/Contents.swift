

/// Knight Shortest Path
/// http://www.lintcode.com/en/problem/knight-shortest-path/
/// - Parameters:
///   - grid: <#grid description#>
///   - source: <#source description#>
///   - destination: <#destination description#>
/// - Returns: Shortest path length
/// How do you calculate shortest path length using BFS?

/*
 1. get shortest path length, need to keep a visited array to store steps
 2. visited array should have value Int.max but visited[source.x][source.y] = 0
 3. isValid need to also check steps[nx][ny] > steps[ox][oy] + 1
 */

typealias Point = (x: Int, y: Int)

func shortestPath(_ grid: [[Int]], source: Point, destination: Point) -> Int {
    guard grid.count > 0 else { return -1 }
    guard source != destination else { return 0 }
    let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
    let dy = [-1, 1, 2, -2, 2, -2, 1, -1]
    
    var queue = [source]
    var steps = Array(repeating: Array(repeatElement(Int.max, count: grid[0].count)), count: grid.count)
    
    steps[source.x][source.y] = 0
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for k in 0 ..< 8 {
            let nx = dx[k] + cur.x, ny = dy[k] + cur.y
            if isValid(cur.x, cur.y, nx, ny, grid, steps) {
                queue.append(Point(nx, ny))
                steps[nx][ny] = steps[cur.x][cur.y] + 1
            }
        }
    }
    return steps[destination.x][destination.y] == Int.max ? -1 : steps[destination.x][destination.y]
}

private func isValid(_ lastX: Int,
                     _ lastY: Int,
                     _ x: Int,
                     _ y: Int,
                     _ grid: [[Int]],
                     _ steps: [[Int]]) -> Bool {
    return x >= 0 && x < grid.count && y >= 0 &&
        y < grid[0].count && grid[x][y] == 0 &&
        steps[x][y] > steps[lastX][lastY] + 1
}


/*
 Use level order
 */

private func nlIsValid(_ grid: [[Character]], _ i: Int, _ j: Int) -> Bool {
    return i >= 0 && i < grid.count && j >= 0 && j < grid[0].count && grid[i][j] == "1"
}

func shortestPathLevel(_ grid: [[Int]], source: Point, destination: Point) -> Int {
    guard grid.count > 0 else { return -1 }
    guard source != destination else { return 0 }
    var steps = Array(repeating: Array(repeatElement(Int.max, count: grid[0].count)), count: grid.count)
    var res = 0
    var queue = [source]
    steps[source.x][source.y] = 0
    let dx = [1, 1, -1, -1, 2, 2, -2, -2]
    let dy = [2, -2, 2, -2, 1, -1, 1, -1]
    while !queue.isEmpty {
        let size = queue.count
        res += 1
        for _ in 0 ..< size {
            let cur = queue.removeFirst() //dequeue
            if cur == destination {
                return steps[cur.x][cur.y]
            }
            for k in 0 ..< 8 {
                let nx = dx[k] + cur.x
                let ny = dy[k] + cur.y
                guard spIsValid(grid, steps, nx, ny) else { continue }
                queue.append(Point(nx, ny))
                steps[nx][ny] = res
            }
        }
    }
    return -1
}

private func spIsValid(_ grid: [[Int]], _ steps: [[Int]], _ i: Int, _ j: Int) -> Bool {
    return i >= 0 && i < steps.count && j >= 0 && j < steps[0].count && steps[i][j] == Int.max && grid[i][j] == 0
}

///////

let testCases = [
    ([
        [0,0,0],
        [0,0,0],
        [0,0,0]
     ], Point(2, 0), Point(2, 2)),
    ([
        [0,1,0],
        [0,0,0],
        [0,0,0]
        ], Point(2, 0), Point(2, 2)),
    ([
        [0,1,0],
        [0,0,1],
        [0,0,0]
        ], Point(2, 0), Point(2, 2)),
    ([
        [1,0,0],
        [0,0,1],
        [0,1,0]
        ], Point(2, 0), Point(0, 2))

]

for tuple in testCases {
    print(shortestPath(tuple.0, source: tuple.1, destination: tuple.2))
    print(shortestPathLevel(tuple.0, source: tuple.1, destination: tuple.2))
}