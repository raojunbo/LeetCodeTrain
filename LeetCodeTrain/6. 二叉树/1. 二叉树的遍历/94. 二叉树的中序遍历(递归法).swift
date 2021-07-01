/*
 * @lc app=leetcode.cn id=94 lang=swift
 *
 * [94] 二叉树的中序遍历
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

class Solution94 {
    //中序遍历，左中右；
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var array:[Int] = []
        inorderT(root, result: &array)
        return array
    }
    
    func inorderT(_ root:TreeNode?,result: inout [Int]) {
        guard let root = root else {
            return
        }
        //左中右
        inorderT(root.left, result: &result)
        result.append(root.val)
        inorderT(root.right, result: &result)
    }
}
// @lc code=end

