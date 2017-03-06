
/// 200. Number of Islands
/// https://leetcode.com/problems/number-of-islands/?tab=Description
/// - Parameter grid: <#grid description#>
/// - Returns: <#return value description#>

typealias Point = (x: Int, y: Int)

func numIslands(_ grid: [[Character]]) -> Int {
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
            grid[x][y] = "0"
        }
    }
}

private func isValid(_ i: Int,
                     _ j: Int,
                     _ grid: [[Character]]) -> Bool {
    return i >= 0 && i < grid.count && j >= 0 &&
        j < grid[0].count && grid[i][j] == "1"
}