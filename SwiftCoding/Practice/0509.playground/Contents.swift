
import UIKit

typealias Point = (x: Int, y: Int)
func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    var grid = grid
    var count = 0
    for (i, row) in grid.enumerated() {
        for (j, col) in row.enumerated() {
            if grid[i][j] == "1" {//then bfs
                count += 1
                numIslandBFS(&grid, i, j)
            }
        }
    }
    return count
}

private func numIslandBFS(_ grid: inout [[Character]],
                          _ i: Int,
                          _ j: Int) {
    var queue = [Point(x: i, y: j)]
    grid[i][j] = "0"
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for k in 0..<4 {
            let nx = dx[k] + cur.x
            let ny = dy[k] + cur.y
            if isValid(grid, i: nx, j: ny) {
                queue.append(Point(x: nx, y: ny))
                grid[nx][ny] = "0"
            }
        }
    }
}

private func isValid(_ grid: [[Character]],
                     i: Int,
                     j: Int) -> Bool {
    return i >= 0 &&
        i < grid.count &&
        j >= 0 &&
        j < grid[i].count &&
        grid[i][j] == "1"
}




