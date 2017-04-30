
import ZHDataStructure
import UIKit

/**
 Rectangle Overlap
 
 Link: http://www.lintcode.com/en/problem/rectangle-overlap/
 
 Category: [<#Description#>]
 
 Question: Given two rectangles, find if the given two rectangles overlap or not.
 
 Notice
 
 l1: Top Left coordinate of first rectangle.
 r1: Bottom Right coordinate of first rectangle.
 l2: Top Left coordinate of second rectangle.
 r2: Bottom Right coordinate of second rectangle.
 
 l1 != r2 and l2 != r2
 
 Time: O(<#Description#>), Space: O(<#Description#>)
 
 */

func doOverlap(l1: Point, r1: Point, l2: Point, r2: Point) -> Bool {
    return !(r1.x < l2.x || r2.x < l1.x || r1.y > l2.y || r2.y > l1.y)
}

/**
 TestCases: <#Description#>
 */
let testCases = [
    <#Description#>
]

for <#Description#> in testCases {
    print(<#Description#>)
}






