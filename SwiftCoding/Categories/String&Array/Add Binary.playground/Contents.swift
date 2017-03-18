
/**
 67. Add Binary - Same for (415. Add Strings) with base 10
 Category:
 
 Question: Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 
 Link: https://leetcode.com/problems/add-binary/?tab=Description

 Time: O(n), Space: O(n) - Swift can't get a char in a string in O(1)
 
 */

func addBinary(_ a: String, _ b: String) -> String {
    return addStrings(a, b, 2)
}

private func addStrings(_ num1: String,
                        _ num2: String,
                        _ delta: Int) -> String {
    var a = [Character](num1.characters)
    var b = [Character](num2.characters)
    
    var i = a.count - 1, j = b.count - 1, carry = 0
    var res = ""
    while i >= 0 || j >= 0 || carry > 0 {
        if i >= 0 {
            carry += Int(String(a[i]))!
            i -= 1
        }
        if j >= 0 {
            carry += Int(String(b[j]))!
            j -= 1
        }
        res = String(carry % delta) + res
        carry /= delta
    }
    return res
}