
import ZHDataStructure

/// K Closest Points
/// http://www.lintcode.com/en/problem/k-closest-points/
/// - Parameters:
///   - points: <#points description#>
///   - origin: <#origin description#>
///   - k: <#k description#>
/// - Returns: <#return value description#>

//Solution 1: Using minHeap, wasting space
func kClosest(_ points: [Point], _ origin: Point, _ k: Int) -> [Point] {
    var res = [Point]()
    guard points.count > 0 else { return [] }
    var pq = PriorityQueue { (p1: Point, p2: Point) -> Bool in
        return getDistance(p1, origin) - getDistance(p2, origin) > 0
    }
    for point in points {
        pq.enqueue(point)
    }
    var k = k
    while !pq.isEmpty {
        if k == 0 {
            break
        }
        res.append(pq.dequeue()!)
        k -= 1
    }
    return res
}

//Solution 2: Max
func kClosestMax(_ points: [Point], _ origin: Point, _ k: Int) -> [Point] {
    var res = [Point]()
    guard points.count > 0 else { return [] }
    var pq = PriorityQueue { (p1: Point, p2: Point) -> Bool in
        return getDistance(p1, origin) > getDistance(p2, origin)
    }
    for point in points {
        pq.enqueue(point)
        if pq.count > k {
            pq.dequeue()
        }
    }
    var k = pq.count
    while !pq.isEmpty {
        res.append(pq.dequeue()!)
        k -= 1
    }
    return res.reversed()
}

private func getDistance(_ p1: Point, _ p2: Point) -> Int {
    return (p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y)
}
