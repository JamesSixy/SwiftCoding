
import ZHDataStructure
/// 235. Lowest Common Ancestor of a Binary Search Tree
/// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/?tab=Description
/// - Parameters:
///   - root: <#root description#>
///   - A: <#A description#>
///   - B: <#B description#>
/// - Returns: <#return value description#>

func lowestCommonAncestorBST(_ root: TreeNode?,
                            _ A: TreeNode?,
                            _ B: TreeNode?) -> TreeNode? {
    guard let A = A, let B = B else { return nil }
    var res = root
    while let cur = res { //also take care of A or B is root
        if (cur.val >= A.val && cur.val <= B.val) || (cur.val <= A.val && cur.val >= B.val) {
            return res
        } else if cur.val > A.val && cur.val > B.val {
            res = cur.left
        } else {
            res = cur.right
        }
    }
    return nil
}