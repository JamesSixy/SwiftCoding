
/**
 200. Number of Islands
 Category: [DFS]
 
 Link: https://leetcode.com/problems/number-of-islands/?tab=Description
 
 通用的DFS时间复杂度计算公式:
 O(答案个数 * 构造每个答案的时间)
 
 Time: O(mn), Space: O(1)
 
 */

func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid, count = 0
    guard grid.count > 0 else { return 0 }
    for (i , row) in grid.enumerated() {
        for (j, _) in row.enumerated() {
            if grid[i][j] == "1" {
                count += 1
                helperDFS(&grid, i, j)
            }
        }
    }
    return count
}

private func helperDFS(_ grid: inout [[Character]],
                       _ i: Int,
                       _ j: Int) {
    guard isValid(i, j, grid) else { return }
    grid[i][j] = "0"
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    for k in 0 ..< 4 {
        let nx = i + dx[k]
        let ny = j + dy[k]
        helperDFS(&grid, nx, ny)
    }
}

private func isValid(_ i: Int,
                     _ j: Int,
                     _ grid: [[Character]]) -> Bool {
    return i >= 0 && i < grid.count && j >= 0 &&
        j < grid[i].count && grid[i][j] == "1"
}
