
import ZHDataStructure
import UIKit

//func topSort(_ graph: [DirectedGraphNode]) -> [DirectedGraphNode] {
//    var res = [DirectedGraphNode]()
//    guard graph.count > 0 else { return res }
//    var dict = getIndegreeDict(graph)
//    
//    var queue = dict.filter { (key, val) -> Bool in
//        return val == 0 }.map { $0.key }
//    res += queue
//    while !queue.isEmpty {
//        let cur = queue.removeFirst()
//        for neighbor in cur.neighbors {
//            dict[neighbor] = dict[neighbor]! - 1
//            if dict[neighbor] == 0 {
//                res.append(cur)
//                queue.append(neighbor)
//            }
//        }
//    }
//    return res
//}
//
//private func getIndegreeDict(_ graph: [DirectedGraphNode]) -> [DirectedGraphNode: Int] {
//    let first = graph.first!
//    var dict = [DirectedGraphNode: Int]()
//    var queue = [first], visited = Set<DirectedGraphNode>()
//    visited.insert(first)
//    
//    while !queue.isEmpty {
//        let cur = queue.removeFirst()
//        for neighbor in cur.neighbors {
//            dict[neighbor] = dict[neighbor]! + 1
//            if !visited.contains(neighbor) {
//                queue.append(neighbor)
//                visited.insert(neighbor)
//            }
//        }
//    }
//    return dict
//}
