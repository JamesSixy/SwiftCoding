
import ZHDataStructure
import UIKit

/**
 23. Merge k Sorted Lists
 Category: [<#Description#>]
 
 Question: <#Description#>
 
 Link: https://leetcode.com/problems/merge-k-sorted-lists/?tab=Description
 Solution: http://www.jiuzhang.com/solutions/merge-k-sorted-lists/
 Return: <#Description#>
 
 Idea:
 
 2,3,4,5
 
 Time: <#Description#>, Space: <#Description#>
 
 */

// Solution 1: Divide & Conquer
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else { return nil }
    return mergeHelper(lists, 0, lists.count - 1)
}

private func mergeHelper(_ lists: [ListNode?],
                         _ start: Int,
                         _ end: Int) -> ListNode? {
    if start == end {
        return lists[start]
    }
    let mid = start + (end - start) / 2
    let left = mergeHelper(lists, start, mid)
    let right = mergeHelper(lists, mid + 1, end)
    return mergeTwoLists(left, right)
}

//checkout 21. Merge Two Sorted Lists, same
private func mergeTwoLists(_ list1: ListNode?,
                           _ list2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var cur = dummy, list1 = list1, list2 = list2
    
    while list1 != nil && list2 != nil {
        if list1!.val < list2!.val {
            cur.next = list1
            list1 = list1?.next
        } else {
            cur.next = list2
            list2 = list2?.next
        }
        cur = cur.next!
    }
    cur.next = list1 == nil ? list2 : list1
    return dummy.next
}

// Solution 2: MinHeap
func mergeKListsHeap(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else { return nil }
    var minHeap = PriorityQueue { (left: ListNode, right: ListNode) -> Bool in
        return left.val < right.val
    }
    
    //enqueue first node of all lists
    for node in lists where node != nil {
        minHeap.enqueue(node!)
    }
    
    let dummy = ListNode(0)
    var cur = dummy
    while !minHeap.isEmpty {
        let node = minHeap.dequeue()
        cur.next = node
        cur = cur.next!
        if let next = node?.next {
            minHeap.enqueue(next)
        }
    }
    return dummy.next
}

// Solution 3: merge two by two
func mergeKListsTwo(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else { return nil }
    var lists = lists
    while lists.count > 1 {
        var res = [ListNode?]()
        for i in stride(from: 0, to: lists.count - 1, by: 2) {
            let mergeList = mergeTwoLists(lists[i], lists[i + 1])
            res.append(mergeList)
        }
        if lists.count % 2 == 1 {
            res.append(lists[lists.count - 1])
        }
        lists = res
    }
    return lists[0]
}




let testCases: [[ListNode?]] = [
    [nil, nil]
]
for arr in testCases {
    mergeKListsTwo(arr)
}




