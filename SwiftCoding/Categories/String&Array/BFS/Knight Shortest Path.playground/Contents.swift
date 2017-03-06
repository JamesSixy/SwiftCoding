
import ZHDataStructure

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

func shortestPath(_ grid: [[Bool]], source: Point, destination: Point) -> Int {
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
                     _ grid: [[Bool]],
                     _ steps: [[Int]]) -> Bool {
    return x >= 0 && x < grid.count && y >= 0 &&
        y < grid[0].count && !grid[x][y] &&
        steps[x][y] > steps[lastX][lastY] + 1
}