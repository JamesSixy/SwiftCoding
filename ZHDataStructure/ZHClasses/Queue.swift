// 1
public struct Queue<T> {
    
    // 2
    fileprivate var list: LinkedList<T>
    public private(set) var count: Int
    
    public init() {
        list = LinkedList<T>()
        count = 0
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    // 3
    public mutating func enqueue(_ element: T) {
        list.append(element)
        count += 1
    }
    
    // 4
    public mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        
        list.remove(element)
        count -= 1
        return element.value
    }
    
    // 5
    public func peek() -> T? {
        return list.first?.value
    }
}

// 1
extension Queue: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        return list.description
    }
}
