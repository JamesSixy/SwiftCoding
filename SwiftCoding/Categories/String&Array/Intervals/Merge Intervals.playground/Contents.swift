
import ZHDataStructure

///
///
/// - Parameter intervals: <#intervals description#>
/// - Returns: <#return value description#>

/**
 56. Merge Intervals
 Category: []
 
 Question: Divide two integers without using multiplication, division and mod operator.
 If it is overflow, return MAX_INT.
 
 Link: https://leetcode.com/problems/merge-intervals/?tab=Description
 
 Idea: Sort the original intervals and then append them one by one
 
 Time: O(nlogn), Space: O(n)
 
 */


func merge(_ intervals: [Interval]) -> [Interval] {
    guard intervals.count > 0 else {
        return []
    }
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
