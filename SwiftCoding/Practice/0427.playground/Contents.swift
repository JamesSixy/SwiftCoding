
import ZHDataStructure
import UIKit

func numIslands(_ grid: [[Character]]) -> Int {
    
    var grid = grid, count = 0
    for (i, rows) in grid.enumerated() {
        for (j, _) in rows.enumerated() {
            if grid[i][j] == "1" {
                count += 1
                NILBFS(&grid, i, j)
            }
        }
    }
    return count
}

private func NILBFS(_ grid: inout [[Character]],
                    _ i: Int,
                    _ j: Int) {
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    var queue = [Point(x: i, y: j)]
    grid[i][j] = "0"
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for k in 0 ..< 4 {
            let nx = cur.x + dx[k]
            let ny = cur.y + dy[k]
            guard NILIsValid(&grid, nx, ny) else { continue }
            queue.append(Point(x: nx, y: ny))
            grid[nx][ny] = "0" //must set to 0 here, otherwise nodes at the same level might add duplicated neighbors
        }
    }
}

private func NILIsValid(_ grid: inout [[Character]],
                        _ i: Int,
                        _ j: Int) -> Bool {
    return i >= 0 &&
        i < grid.count &&
        j >= 0 &&
        j < grid[i].count &&
        grid[i][j] == "1"
}


