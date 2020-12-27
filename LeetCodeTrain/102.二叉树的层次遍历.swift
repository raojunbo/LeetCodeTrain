/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层次遍历
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution102 {
    var queue:[TreeNode] = []
    var result:[[Int]] = []
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        //层序遍历；即广度优先遍历
        //层序遍历用队列
        guard let root = root else {
            return []
        }
        queue.append(root)
        while !queue.isEmpty {
            let size = queue.count
            var innerArray:[Int] = []
            for _ in 0...size - 1 {
                let node = queue.removeFirst()
                innerArray.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(innerArray)
        }
        return result
    }
    
    static func test() {
        let node3 = TreeNode(3)
        let node9 = TreeNode(9)
        let node20 = TreeNode(20)
        let node15 = TreeNode(15)
        let node7 = TreeNode(7)
        
        node3.left = node9
        node3.right = node20
        node20.left = node15
        node20.right = node7
        
        let result = Solution102().levelOrder(node3)
        print(result)
        
    }
}
// @lc code=end

