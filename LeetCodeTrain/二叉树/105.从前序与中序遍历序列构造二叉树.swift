/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
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
class Solution105 {
    //根据一颗树的前序遍历和中序遍历构造二叉树
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
       let root = build(preorder, inorder, preStart: 0, preEnd: preorder.count - 1, inStart: 0, inEnd: inorder.count - 1)
        return root
    }
    
    func build(_ preorder: [Int],
               _ inorder: [Int],
               preStart: Int,
               preEnd: Int,
               inStart: Int,
               inEnd: Int
               ) -> TreeNode? {
        // 退出条件
        if preStart > preEnd {
            return nil
        }
        if inStart > inEnd {
            return nil
        }
        // 当前范围的根节点
        let rootV = preorder[preStart]
        // 在中序子序列中寻找根节点
        var len = 0
        var inOrderEnd = inEnd
        for index in inStart..<inorder.count {
            let value = inorder[index]
            // 找到了根节点
            if value == rootV {
                len = index - inStart
                inOrderEnd = index
                break
            }
        }
        let newNode = TreeNode(rootV)
        // 递归构建左子树
        let leftNode = build(preorder, inorder, preStart: preStart + 1, preEnd: preStart + len, inStart: inStart, inEnd: inOrderEnd - 1)
        // 递归构建右子树
        let rightNode = build(preorder, inorder, preStart: preStart + len + 1, preEnd: preEnd, inStart: inOrderEnd + 1, inEnd: inEnd)
        // 串联
        newNode.left = leftNode
        newNode.right = rightNode
        return newNode
    }
    
    static func test(){
        let preorder = [3,9,20,15,7]
        let inorder = [9,3,15,20,7]
        let solution = Solution105()
        let root = solution.buildTree(preorder, inorder)
    }
}
// @lc code=end

