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
    // 第二遍练习 二叉树的最大深度（哈哈已经形成了套路）
    // 1. 种方法层序遍历算层数
    // 2. 前序遍历算递归深度
    // 这采用递归法 深度优先遍历
    func maxDepth2(_ root: TreeNode?) -> Int {
        return maxDepthRecursion(root)
    }
    func maxDepthRecursion(_ node: TreeNode?) ->Int {
        if node == nil {
            return 0
        }
        let leftDepth = maxDepthRecursion(node?.left)
        let rightDepth = maxDepthRecursion(node?.right)
        return max(leftDepth, rightDepth) + 1
    }
    
    // 第二遍练习
    // 采用层序遍历
    func maxDepth3(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue: [TreeNode] = []
        queue.append(root)
        var level:Int = 0
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                size -= 1
            }
            level += 1
        }
        return level
    }
    static func test () {
        let rootNode = TreeNode(1)
        let node3 = TreeNode(3)
        let node2 = TreeNode(2)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        
        
        
        rootNode.left = node3
        rootNode.right = node2
        node3.right = node4
        node4.left = node5
       
        
        let result = Solution104().maxDepth3(rootNode)
        print(result)
    }
}
// @lc code=end

