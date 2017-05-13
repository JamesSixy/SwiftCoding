
import ZHDataStructure
import UIKit

func zombie(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else { return -1 }
    var queue: [Point] = [], grid = grid, count = 0
    for (i, row) in grid.enumerated() {
        for (j, col) in row.enumerated() {
            if grid[i][j] == 1 {
                queue.append(Point(x: i, y: j))
            }
        }
    }
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    while !queue.isEmpty {
        let size = queue.count
        count += 1
        for _ in 0 ..< size {
            let cur = queue.removeFirst()
            for k in 0 ..< 4 {
                let nx = cur.x + dx[k]
                let ny = cur.y + dy[k]
                if isValid(nx, ny, grid) {
                    grid[nx][ny] = 1
                    queue.append(Point(x: nx, y: ny))
                }
            }
        }
    }
    for (i, row) in grid.enumerated() {
        for (j, col) in row.enumerated() {
            if grid[i][j] == 0 {
                return -1
            }
        }
    }
    return count
}

private func isValid(_ x: Int, _ y: Int, _ grid: [[Int]]) -> Bool {
    return x >= 0 &&
        x < grid.count &&
        y >= 0 &&
        y < grid[0].count &&
        grid[x][y] == 0
}
