
import ZHDataStructure

//enum Numbers: String {
//    case Zero = "0"
//    case One = "1"
//}

typealias Point = (x: Int, y: Int)

func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    var res = 0, grid = grid
    for (i, row) in grid.enumerated() {
        for (j, _) in row.enumerated() {
            if grid[i][j] == "1" {
                res += 1
                nlBFS(&grid, i, j)
            }
        }
    }
    return res
}

private func nlBFS(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
    let root: Point = (i, j)
    var queue = [root]
    grid[i][j] = "0"
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    while !queue.isEmpty {
        let cur = queue.removeFirst() //dequeue
        for k in 0 ..< 4 {
            let nx = dx[k] + cur.x, ny = dy[k] + cur.y
            if nlIsValid(grid, nx, ny) {
                queue.append((nx, ny)) //enqueue
                grid[nx][ny] = "0"
            }
        }
    }
}

private func nlIsValid(_ grid: [[Character]], _ i: Int, _ j: Int) -> Bool {
    return i >= 0 && i < grid.count && j >= 0 && j < grid[0].count && grid[i][j] == "1"
}