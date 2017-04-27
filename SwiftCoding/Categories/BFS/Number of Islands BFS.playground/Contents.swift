
/**
 200. Number of Islands
 
 Category: [BFS]
 
 Question: Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 Link: https://leetcode.com/problems/number-of-islands/?tab=Description
 
 Time: O(n^2), Space: O(n^2)
 
 */

typealias Point = (x: Int, y: Int)

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
            guard NILIsValid(grid, nx, ny) else { continue }
            queue.append(Point(x: nx, y: ny))
            grid[nx][ny] = "0" //must set to 0 here, otherwise nodes at the same level might add duplicated neighbors
        }
    }
}

private func NILIsValid(_ grid: [[Character]],
                        _ i: Int,
                        _ j: Int) -> Bool {
    return i >= 0 &&
        i < grid.count &&
        j >= 0 &&
        j < grid[i].count &&
        grid[i][j] == "1"
}

//older version
func numIslands2(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    var grid = grid, count = 0
    for (i, row) in grid.enumerated() {
        for (j, _) in row.enumerated() {
            if (grid[i][j] == "1") {
                count += 1
                islandBFS(&grid, i, j)
            }
        }
    }
    return count
}

private func islandBFS(_ grid: inout [[Character]],
                       _ i: Int,
                       _ j: Int) {
    
    var queue: [Point] = [(i, j)]
    grid[i][j] = "0"
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    while !queue.isEmpty {
        let cur = queue.removeFirst() //dequeue
        
        for k in 0 ..< 4 {
            let x = dx[k] + cur.x
            let y = dy[k] + cur.y
            
            guard isValid(x, y, grid) else { continue }
            
            queue.append((x, y)) //enqueue
            grid[x][y] = "0" //must set to 0 here, otherwise nodes at the same level might add duplicated neighbors
        }
    }
}

private func isValid(_ i: Int,
                     _ j: Int,
                     _ grid: [[Character]]) -> Bool {
    return i >= 0 &&
        i < grid.count &&
        j >= 0 &&
        j < grid[0].count &&
        grid[i][j] == "1"
}
