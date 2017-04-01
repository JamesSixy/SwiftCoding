
import ZHDataStructure

/**
 253. Meeting Rooms II
 Category: []
 
 Question: Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
 
 For example,
 Given [[0, 30],[5, 10],[15, 20]],
 return 2.
 
 Link: https://leetcode.com/problems/meeting-rooms-ii/?tab=Description
 
 Idea: Sort start and end separately, then count conflicts
 
 Time: O(nlogn), Space: O(n)
 
 */

func minMeetingRoomsDZ(_ intervals: [Interval]) -> Int {
    let starts = intervals.map { interval in interval.start }.sorted()
    let ends = intervals.map { interval in interval.end }.sorted()
    var i = 0, j = 0, count = 0
    
    while i < starts.count && j < ends.count {
        if starts[i] < ends[j] {
            count += 1
            i += 1
        } else {
            i += 1
            j += 1
        }
    }
    
    return count
}


typealias Point = (time: Int, flag: Int)

func minMeetingRooms(_ intervals: [Interval]) -> Int {
    var list: [Point] = []
    for i in intervals {
        list.append(Point(i.start, 1))
        list.append(Point(i.end, 0))
    }
    
    list.sort { (p1, p2) -> Bool in
        if p1.time == p2.time {
            return p1.flag < p2.flag
        } else {
            return p1.time < p2.time
        }
    }
    
    var count = 0, res = 0
    for p in list {
        if p.flag == 1 { //start
            count += 1
        } else {
            count -= 1
        }
        res = max(count, res)
    }
    return res
}
