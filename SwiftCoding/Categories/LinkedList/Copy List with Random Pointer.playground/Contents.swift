
public class RandomListNode {
    public let label: Int
    public var next: RandomListNode?
    public var random: RandomListNode?
    public init(_ label: Int) {
        self.label = label
    }
}

extension RandomListNode: Hashable {
    public var hashValue: Int {
        return label.hashValue ^ String(describing: next).hashValue
    }
    
    public static func ==(lhs: RandomListNode, rhs: RandomListNode) -> Bool {
        return lhs === rhs
    }
}

/// Copy List with Random Pointer
/// http://www.lintcode.com/en/problem/copy-list-with-random-pointer/
/// - Parameter head: <#head description#>
/// - Returns: <#return value description#>

func copyRandomList(head: RandomListNode?) -> RandomListNode? {
    guard let head = head else { return nil }
    //copy nodes
    let dict = copyNodes(head)
    
    //copy random
    var cur: RandomListNode? = head
    while cur != nil {
        let copy = cur!, copyRandom = cur!.random!
        dict[copy]?.random = dict[copyRandom]
        cur = cur?.next
    }
    
    return dict[head]
}

private func copyNodes(_ cur: RandomListNode?) -> [RandomListNode : RandomListNode] {
    var dict = [RandomListNode : RandomListNode](), cur = cur
    let dummy = RandomListNode(1)
    dummy.next = cur
    var prev = dummy
    while cur != nil {
        let copy = RandomListNode(cur!.label)//copy node
        dict[cur!] = copy
        cur = cur?.next
        prev.next = copy //copy .next
        prev = copy
    }
    return dict
}
