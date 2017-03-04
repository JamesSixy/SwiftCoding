
import ZHDataStructure

/// Subtree with Maximum Average
/// http://www.lintcode.com/en/problem/subtree-with-maximum-average/#
/// - Parameter root:
/// - Returns: max average root of subtree

typealias Tuple = (root: TreeNode?, sum: Int, size: Int)

var lastTuple: Tuple?

//Traverse + D&C
func findSubtree2(_ root: TreeNode?) -> TreeNode? {
    helper(root)
    return lastTuple?.root
}

private func helper(_ root: TreeNode?) -> Tuple {
    guard let root = root else {
        return (nil, 0, 0)
    }
    let left = helper(root.left)
    let right = helper(root.right)
    
    let sum = left.sum + right.sum + root.val
    let size = left.size + right.size + 1
    let rootTriple: Tuple = (root, sum, size)

    if lastTuple == nil || sum * lastTuple!.size > size * lastTuple!.sum {
        lastTuple = rootTriple
    }
    return rootTriple
}

//D&C

//typealias TupleDC = (maxRoot: TreeNode?,
//                         sum: Int,
//                        size: Int,
//                  maxRootSum: Int,
//                 maxRootSize: Int)
//
//func findSubtree2DC(_ root: TreeNode?) -> TreeNode? {
//    return helperDC(root).maxRoot
//}
//
//private func helperDC(_ root: TreeNode?) -> TupleDC {
//    guard let root = root else {
//        return (nil, 0, 0, Int.min, Int.min)
//    }
//    let left = helperDC(root.left)
//    let right = helperDC(root.right)
//
//    //maxRoot, sum of all nodes, size of all nodes
//    let sum = left.sum + right.sum + root.val
//    let size = left.size + right.size + 1
//
//    let leftNil = left.maxRootSize == Int.min
//    let rightNil = right.maxRootSize == Int.min
//    let sumLargetThanLeft = leftNil ? true : sum * left.maxRootSize > size * left.maxRootSum
//    let sumLargetThanRight = rightNil ? true : sum * right.maxRootSize > size * right.maxRootSum
//    let leftLargeThanRight = rightNil ? true : left.sum * right.maxRootSize > left.size * right.maxRootSum
//    let rightLargeThanLeft = leftNil ? true : left.sum * right.maxRootSize < left.size * right.maxRootSum
//    
//    if sumLargetThanLeft && sumLargetThanRight {
//        return (root, sum, size, sum, size)
//    } else if leftLargeThanRight {
//        return (left.maxRoot, sum, size, left.sum, left.size)
//    } else if rightLargeThanLeft {
//        return (right.maxRoot, sum, size, right.sum, right.size)
//    }
//    return (root, sum, size, sum, size)
//}


//Test
let testData = [
    [1, -5, 11, 1, 2, 4, -2], //11
    [1, 2, 1], //2
    [0, 6],//6
    [6],//6
    [4, -3],//4
    [2, 4, 3]//4
]
for arr in testData {
    let root = arrayToBinaryTree(arr, 0)
    print(preorderTraversal(root))
    print(findSubtree2(root)!.val)
    lastTuple = nil

//    print(findSubtree2DC(root)!.val)
}


