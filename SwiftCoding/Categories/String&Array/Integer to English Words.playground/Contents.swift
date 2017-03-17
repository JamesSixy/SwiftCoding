
import UIKit

/// 273. Integer to English Words
/// https://leetcode.com/problems/integer-to-english-words/?tab=Description
/// - Parameter num: <#num description#>
/// - Returns: <#return value description#>

let l1 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
let l2 = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
let l3 = "Hundred"
let l4 = ["", "Thousand", "Million", "Billion"]

func numberToWordsRecursion(_ num: Int) -> String {

    guard num > 0 else { return "Zero" }
    var res = "", i = 0, num = num
    while num > 0 {
        let threeDigits = num % 1000
        if threeDigits != 0 {
            res = helper(threeDigits) + l4[i] + " " + res
        }
        num /= 1000
        i += 1
    }
    return res.trimmingCharacters(in: .whitespacesAndNewlines)
}

private func helper(_ num: Int) -> String {
    if num == 0 {
        return ""
    } else if num < 20 {
        return l1[num] + " "
    } else if num < 100 {
        return l2[num / 10] + " " + helper(num % 10)
    } else {
        return l1[num / 100] + " " + l3 + " " + helper(num % 100)
    }
}

func numberToWords(_ num: Int) -> String {
    guard num > 0 else { return "Zero" }
    var res = "", num = num, digit = 0
    while num > 0 {
        var tmp = "", token = num % 1000
        if token > 99 {
            tmp += "\(l1[token / 100]) \(l3) "
            token %= 100
        }
        if token > 19 {
            tmp += "\(l2[token / 10]) "
            token %= 10
        }
        if token > 0 {
            tmp += "\(l1[token]) "
        }
        
        if tmp != "" {
            res = tmp + l4[digit] + " " + res
        } else {
            res = tmp + res
        }
        digit += 1
        num /= 1000
    }
    return res.trimmingCharacters(in: .whitespacesAndNewlines)
}
