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
    // 第二遍练习
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
    
    // 第二遍练习(第二遍一次性通过)
    // 定义函数输入与输出
    // 定义本层的罗逻辑处理
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        var array: [Int] = []
        preorderT2(root, array: &array)
        return array
    }
    func preorderT2(_ root: TreeNode?, array: inout [Int]) {
        if root == nil {
            return
        }
        array.append(root!.val)
        preorderT2(root?.left, array: &array)
        preorderT2(root?.right, array: &array)
    }
    // 第二遍（采用迭代法）
    // 二叉树递归法，利用的是栈所以采用的是迭代吗
    func preorderTraversal3(_ root: TreeNode?) -> [Int] {
        return []
    }
    //
    static func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node1.right = node2
        node2.left = node3
        let result = Solution144().preorderTraversal2(node1)
        print(result)
    }
}
// @lc code=end

