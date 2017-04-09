/**
 * Question Link: https://leetcode.com/problems/anagrams/
 * Primary idea: Iterate the string array and categories strings with the same sorted one
 *
 
 For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Return:
 
 [
 ["ate", "eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]

 
 * Time Complexity: O(nmlogm + nlogn), n stands for number of words, m stands for the length of a word
 *                  Space Complexity: O(n)
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var map = [String: [String]]()
    
    for str in strs {
        let sortedStr = String(str.characters.sorted())
        
        var anagrams = [String]()
        if let list = map[sortedStr] {
            anagrams = list
        }
        anagrams.append(str)
        map[sortedStr] = anagrams
    }
    
    return map.values.map { value in value.sorted() }
}
