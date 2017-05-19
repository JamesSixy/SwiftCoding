
/**
 463. Island Perimeter
 
 Category: [BFS]
 
 Question: You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 
 Link: https://leetcode.com/problems/island-perimeter/?tab=Description
 
 Time: , Space:
 
 */

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
