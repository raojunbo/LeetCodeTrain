/*
 * @lc app=leetcode.cn id=104 lang=swift
 *
 * [104] 二叉树的最大深度
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
//两种思路
//1. 层序遍历,广度优先搜索
//2. 递归：递归表达式 max(l,r)+1
class Solution104 {
    //采用递归的方式
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let level = maxDepathT(root)
        return level
    }
    
    func maxDepathT(_ root:TreeNode?) -> Int{
        guard let root = root else {
            return 0
        }
        let leftLevel = maxDepathT(root.left)
        let rightLevel = maxDepathT(root.right)
        if leftLevel > rightLevel {
            return leftLevel + 1
        } else {
            return rightLevel + 1
        }
    }

    
    //采用层序遍历
    func levelDepath(_ root:TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue:[TreeNode] = [root]
        var level = 0
        while !queue.isEmpty {
            let size = queue.count
            level += 1
            for _ in 0...size - 1 {
                let item = queue.removeFirst()
                if let left = item.left {
                    queue.append(left)
                }
                if let right = item.right {
                    queue.append(right)
                }
            }
        }
        return level
    }
    
    static func test () {
        let rootNode = TreeNode(1)
        let node3 = TreeNode(3)
        let node2 = TreeNode(2)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        
        
        rootNode.left = node3
        rootNode.right = node2
        node3.right = node4
        node4.left = node5
       
        
        let result = Solution104().maxDepth(rootNode)
        
    }
}
// @lc code=end

