
import ZHDataStructure
import UIKit

func shortestPath(_ grid: [[Int]],
                  source: Point,
                  destination: Point) -> Int {
    guard grid.count > 0 else { return -1 }
    guard source != destination else { return 0 }
    let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
    let dy = [-1, 1, 2, -2, 2, -2, 1, -1]
    
    var visited = Array(repeatElement(Array(repeatElement(Int.max, count: grid[0].count)), count: grid.count))
    
    var queue = [source]
    visited[source.x][source.y] = 0

    while !queue.isEmpty {
        let size = queue.count
        for i in 0 ..< size {
            let cur = queue.removeFirst()
            
            for k in 0 ..< 8 {
                let nx = cur.x + dx[k]
                let ny = cur.y + dy[k]
                if isValid(nx, ny, grid, visited) {
                    let next = Point(x: nx, y: ny)
                    if destination == next {
                        return visited[cur.x][cur.y] + 1
                    }
                    queue.append(next)
                    visited[nx][ny] = visited[cur.x][cur.y] + 1
                }
            }
        }
    }
    return -1
}

private func isValid(_ nx: Int,
                     _ ny: Int,
                     _ grid: [[Int]],
                     _ visited: [[Int]]) -> Bool {
    return nx >= 0 &&
        ny >= 0 &&
        nx < grid.count &&
        ny < grid[0].count &&
        grid[nx][ny] == 0 &&
        visited[nx][ny] == Int.max
}
