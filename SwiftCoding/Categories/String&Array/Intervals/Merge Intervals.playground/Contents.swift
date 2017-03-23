
import ZHDataStructure

/**
 56. Merge Intervals
 Category: [ITV]
 
 Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
 
 Link: https://leetcode.com/problems/merge-intervals/?tab=Description

 Time: O(n), Space: O(1)
 
 Very similar to Meeting Rooms
 
 */

func merge(_ intervals: [Interval]) -> [Interval] {
    guard intervals.count > 0 else { return [] }
    let sort = intervals.sorted {$0.start < $1.start }
    var res: [Interval] = []
    var last = sort[0]
    for cur in sort {
        if last.end >= cur.start {
            //a includes b or a intersects b
            last.end = max(last.end, cur.end)
        } else {
            res.append(last)
            last = cur
        }
    }
    res.append(last)
    return res
}
