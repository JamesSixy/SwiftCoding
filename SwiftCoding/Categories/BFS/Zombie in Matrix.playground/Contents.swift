
/**
 Zombie in Matrix
 
 Category: [BFS]
 
 Question: Given a 2D grid, each cell is either a wall 2, a zombie 1 or people 0 (the number zero, one, two).Zombies can turn the nearest people(up/down/left/right) into zombies every day, but can not through wall. How long will it take to turn all people into zombies? Return -1 if can not turn all people into zombies.
 
 Link: http://www.lintcode.com/en/problem/zombie-in-matrix/
 
 Time: O(n), Space: O(n)
 
 */

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
    return x >= 0 &&
        x < grid.count &&
        y >= 0 &&
        y < grid[0].count &&
        grid[x][y] == 0
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
