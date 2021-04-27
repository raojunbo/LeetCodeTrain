/*
 * @lc app=leetcode.cn id=236 lang=swift
 *
 * [236] 二叉树的最近公共祖先
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

class Solution236 {
    var ans: TreeNode?
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        //思路：中序遍历p，中序遍历q。找父节点后序遍历。
        guard let root = root else {
            return nil
        }
        //如果当前节点==p,即找到了节点
        if root === p {
            return p
        }
        //若果当前节点,即找到了节点
        if root === q {
            return q
        }
        
        let leftNode = lowestCommonAncestor(root.left, p, q)
        let rightNode = lowestCommonAncestor(root.right, p, q)
        
        //回到了当前层时。左边没有节点时,看是不是右边
        if leftNode == nil {
            return rightNode
        }
        //回到了当前层时。右边没有节点时，看是不是左边
        if rightNode == nil {
            return leftNode
        }
        return root
    }
    // 第二次练习
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
    }
    static func test() {
       let solution = Solution236()
        let root = TreeNode()
        let p = TreeNode()
        let q = TreeNode()
        
       let r =  solution.lowestCommonAncestor2(root, p, q)
    }
}
// @lc code=end

