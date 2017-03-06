
/// Zombie in Matrix
/// http://www.lintcode.com/en/problem/zombie-in-matrix/
/// - Parameter grid: <#grid description#>
/// - Returns: <#return value description#>

typealias Point = (x: Int, y: Int)

func zombie(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else { return -1 }
    var grid = grid, days = 0
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var queue = getAllZombies(grid)

    while !queue.isEmpty {
        let size = queue.count
        days += 1
        for _ in 0 ..< size {
            let cur = queue.removeFirst()
            for k in 0 ..< 4 {
                let nx = cur.x + dx[k], ny = cur.y + dy[k]
                if isValid(nx, ny, grid) {
                    queue.append((nx, ny))
                    grid[nx][ny] = 1
                }
            }
        }
    }
    
    for (i, row) in grid.enumerated() {
        for (j, _) in row.enumerated() {
            if grid[i][j] == 0 {
                return -1
            }
        }
    }
    return days
}

private func isValid(_ x: Int, _ y: Int, _ grid: [[Int]]) -> Bool {
    return x >= 0 && x < grid.count && y >= 0 &&
        y < grid[0].count && grid[x][y] == 0
}

private func getAllZombies(_ grid: [[Int]]) -> [Point] {
    var queue = [Point]()
    for (i, row) in grid.enumerated() {
        for (j, _) in row.enumerated() {
            if grid[i][j] == 1 {
                queue.append((i, j))
            }
        }
    }
    return queue
}