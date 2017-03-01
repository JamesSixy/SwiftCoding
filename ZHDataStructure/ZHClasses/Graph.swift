
import Foundation

public class DirectedGraphNode {
    public let label: Int
    public let neighbors: [DirectedGraphNode]
    init(label: Int, neighbors: [DirectedGraphNode] = []) {
        self.label = label
        self.neighbors = neighbors
    }
}

extension DirectedGraphNode: Hashable {
    public var hashValue: Int {
        return label.hashValue ^ String(describing: neighbors).hashValue
    }
    
    public static func ==(lhs: DirectedGraphNode, rhs: DirectedGraphNode) -> Bool {
        return lhs === rhs
    }
}

public class UndirectedGraphNode {
    public let label: Int
    public let neighbors: [UndirectedGraphNode]
    init(label: Int, neighbors: [UndirectedGraphNode] = []) {
        self.label = label
        self.neighbors = neighbors
    }
}

extension UndirectedGraphNode: Hashable {
    public var hashValue: Int {
        return label.hashValue ^ String(describing: neighbors).hashValue
    }
    
    public static func ==(lhs: UndirectedGraphNode, rhs: UndirectedGraphNode) -> Bool {
        return lhs === rhs
    }
}
