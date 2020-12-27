/*
 * @lc app=leetcode.cn id=515 lang=swift
 *
 * [515] 在每个树行中找最大值
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution515 {
    var queue:[TreeNode] = []
    var result:[Int] = []
    func largestValues(_ root: TreeNode?) -> [Int] {
        //采用层序遍历
        guard let root = root else {
            return []
        }
        queue.append(root)
        while !queue.isEmpty {
            let size = queue.count
            var innerMax = -Int.max
            for _ in 0...size - 1 {
                let item = queue.removeFirst()
                if item.val > innerMax {
                    innerMax = item.val
                }
                if let left = item.left {
                    queue.append(left)
                }
                if let right = item.right {
                    queue.append(right)
                }
            }
            result.append(innerMax)
        }
        return result
    }
    
    static func test() {
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node2 = TreeNode(2)
        let node5 = TreeNode(5)
        let node31 = TreeNode(3)
        let node9 = TreeNode(9)
        
        node1.left = node3
        node1.right = node2
        node3.left = node5
        node3.right = node31
        node2.right = node9
        let result = Solution515().largestValues(node1)
        print(result)
    }
}
// @lc code=end

