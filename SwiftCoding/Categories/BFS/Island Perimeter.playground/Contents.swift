
/// 463. Island Perimeter
/// https://leetcode.com/problems/island-perimeter/?tab=Description
/// - Parameter grid: <#grid description#>
/// - Returns: <#return value description#>

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var islands = 0, neighbors = 0
    
    for i in 0 ..< grid.count {
        for j in 0 ..< grid[0].count {
            if grid[i][j] == 1 {
                islands += 1
                if i < grid.count - 1 && grid[i + 1][j] == 1 {
                    neighbors += 1
                }
                if (j < grid[0].count - 1 && grid[i][j + 1] == 1) {
                    neighbors += 1
                }
            }
        }
    }
    
    return islands * 4 - neighbors * 2
}
