
import ZHDataStructure

/**
 252. Meeting Rooms
 Category: []
 
 Question: Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.
 
 For example,
 Given [[0, 30],[5, 10],[15, 20]],
 return false.
 Link: https://leetcode.com/problems/meeting-rooms/?tab=Description
 
 Idea: Sort and traverse, find if any conflicts exist
 
 Time: O(nlogn), Space: O(1)
 
 */

func canAttendMeetings(_ intervals: [Interval]) -> Bool {
    guard intervals.count > 0 else { return true }
    let sorted = intervals.sorted { $0.start < $1.start }
    var lastEnd = sorted[0].end
    for i in 1 ..< sorted.count {
        let cur = sorted[i]
        if lastEnd > cur.start {
            return false
        }
        lastEnd = max(lastEnd, cur.end)
    }
    return true
}