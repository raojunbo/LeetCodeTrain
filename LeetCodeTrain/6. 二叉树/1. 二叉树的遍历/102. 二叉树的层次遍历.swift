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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        //层序遍历；即广度优先遍历
        //层序遍历用队列
        var result:[[Int]] = []
        guard let root = root else {
            return result
        }
        var queue:[TreeNode] = []
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
    
    // 第二遍练习
    // 层遍历需用到队列
    func levelOrder2(_ root: TreeNode?) -> [[Int]] {
        var result:[[Int]] = []
        guard let root = root else {
            return result
        }
        var queue:[TreeNode] = []
        queue.append(root)
        // 外层
        while !queue.isEmpty {
            // 当前层的大小
            var size = queue.count
            var levelArray: [Int] = []
            while size > 0 {
                // 出队
                let node = queue.removeFirst()
                levelArray.append(node.val)
                size -= 1
                // 将左右节点入栈
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(levelArray)
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
        
        let result = Solution102().levelOrder2(node3)
        print(result)
    }
}
// @lc code=end

