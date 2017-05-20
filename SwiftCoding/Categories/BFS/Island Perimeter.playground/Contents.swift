
import ZHDataStructure
import UIKit

/**
 463. Island Perimeter
 
 Category: [BFS]
 
 Question: You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 
 Link: https://leetcode.com/problems/island-perimeter/?tab=Description
 
 Time: O(n * m), Space: O(n * m) - BFS
 
 */

public typealias Point = (x: Int, y: Int)

//BFS
func islandPerimeter(_ grid: [[Int]]) -> Int {
    
    let res = 0
    guard grid.count > 0 else { return res }
    
    for (i, row) in grid.enumerated() {
        for (j, _) in row.enumerated() {
            if grid[i][j] == 1 {
                return islandBFS(i, j, grid)
            }
        }
    }
    return res
}

private func islandBFS(_ i: Int,
                       _ j: Int,
                       _ grid: [[Int]]) -> Int {
    var queue = [Point(x: i, y: j)], res = 0
    var visited = Array(repeating: Array(repeatElement(false, count: grid[0].count)), count: grid.count)
    visited[i][j] = true
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for k in 0 ..< 4 {
            let nx = cur.x + dx[k]
            let ny = cur.y + dy[k]
            let np = Point(x: nx, y: ny)
            if isValid(grid, nx, ny) {
                if !visited[nx][ny] {
                    queue.append(np)
                    visited[nx][ny] = true
                }
            } else {
                res += 1
            }
        }
    }
    return res
}

private func isValid(_ grid: [[Int]],
                     _ i: Int,
                     _ j: Int) -> Bool {
    return i >= 0 &&
        i < grid.count &&
        j >= 0 &&
        j < grid[i].count &&
        grid[i][j] == 1
}

//Daozhang
func islandPerimeterDZ(_ grid: [[Int]]) -> Int {
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
