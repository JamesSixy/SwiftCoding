
import ZHDataStructure

/**
 57. Insert Interval
 Category: [ITV]
 
 Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
 
 Link: https://leetcode.com/problems/insert-interval/?tab=Description
 
 Time: O(n), Space: O(1)
 */

func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
    guard intervals.count > 0 else {
        return [newInterval]
    }
    var res: [Interval] = []
    var i = 0
    for cur in intervals {
        if cur.end < newInterval.start {
            i += 1
            res.append(cur)
        } else if cur.start > newInterval.end {
            res.append(cur)
        } else {
            newInterval.start = min(newInterval.start, cur.start)
            newInterval.end = max(newInterval.end, cur.end)
        }
    }
    res.insert(newInterval, at: i)
    return res
}