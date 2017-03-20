
import ZHDataStructure

/**
 57. Insert Interval
 Category: []
 
 Question: Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
 
 You may assume that the intervals were initially sorted according to their start times.
 
 Example 1:
 Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].
 
 Example 2:
 Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as [1,2],[3,10],[12,16].
 
 This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
 
 Link: https://leetcode.com/problems/insert-interval/?tab=Description
 
 Idea: <#Description#>
 
 Time: <#Description#>, Space: <#Description#>
 
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