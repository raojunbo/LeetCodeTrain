/*
 * @lc app=leetcode.cn id=111 lang=swift
 *
 * [111] 二叉树的最小深度
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
class Solution111 {
    //广度优先（层序遍历）
    var queue:[TreeNode]  = []
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        queue.append(root)
        var level = 0
        while !queue.isEmpty {
            level += 1
            let size = queue.count
            for _ in 0...size - 1 {
                let node = queue.removeFirst()
                if node.left == nil && node.right == nil {
                    return level
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return level
    }
    
    //采用深度优先遍历
    func minDepth2(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        if node.left == nil && node.right == nil {
            return 1
        }
        var deep = Int.max
        if node.left != nil {
            deep = min(deep, minDepth2(node.left))
        }
        if node.right != nil {
            deep = min(deep, minDepth2(node.right))
        }
        return deep + 1
    }
    
    // 第二次练习(有点细节需要处理)
    // 二叉树的最小深度
    // 思路 同样是采用深度优先遍历
    func minDepth3(_ root: TreeNode?) -> Int {
        return minDepathRecuse(root)
    }
    func minDepathRecuse(_ node: TreeNode?) -> Int {
        // 当根节点为空
        guard let node = node else {
            return 0
        }
        var minV = Int.max
        // 如果左右节点都是空
        if node.left == nil && node.right == nil {
            minV = 0
        }
        // 只有左边是空
        if node.left != nil {
            minV = min(minDepathRecuse(node.left), minV)
        }
        // 只有右边是空
        if node.right != nil {
            minV  = min(minDepathRecuse(node.right), minV)
        }
        return minV + 1
    }
    
    static func test() {
        let rootNode = TreeNode(3)
        let node9 = TreeNode(9)
        let node20 = TreeNode(20)
        let node15 = TreeNode(15)
        let node7 = TreeNode(7)
        
        rootNode.left = node9
        rootNode.right = node20
        node20.left = node15
        node20.right = node7
        
        let level = Solution111().minDepth3(rootNode)
        print(level)
    }
}
// @lc code=end

