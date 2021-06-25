/*
 * @lc app=leetcode.cn id=144 lang=swift
 *
 * [144] 二叉树的前序遍历
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
class Solution144 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result:[Int] = []
        preOrderT(root, result: &result)
        return result
    }
    
    func preOrderT(_ root: TreeNode?,result:inout [Int])  {
        guard let root = root else {
            return
        }
        result.append(root.val)
        preOrderT(root.left, result: &result)
        preOrderT(root.right, result: &result)
    }
    // 第二遍练习
    // 定义函数输入与输出
    //
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {

    }
    func preorderT(_ root: TreeNode?) {
        
    }
    static func test() {
        let node1 = Node(1)
        let node2 = Node(2)
        let node3 = Node(3)
        node1.right = node2
        node2.let = node3
        let result = Solution144().preorderTraversal2(rootNode)
    }
    
}
// @lc code=end

