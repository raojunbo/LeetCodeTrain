//
//  101. 对称二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution101 {
    // 是否是对称二叉树的判定
    // 肯定是用递归去解决
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left!.val != right!.val {
            return false
        }
        let leftM = isMirror(left?.left, right?.right)
        let rightM = isMirror(left?.right, right?.left)
        return leftM && rightM
    }
    // 第二遍练习(知道怎样操作，竟然没有做出来？？)
    // 思路：比较的是两个子树是否是相互反转的（非常重要）
    // 思路：递归表达式，左节点的左边等于右节点的右边；左节点的右边等于右节点的左边
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        return compare(root?.left, root?.right)
    }
    func compare(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left?.val != right?.val {
            return false
        }
        let leftm = compare(left?.left, right?.right)
        let rightm = compare(left?.right, right?.left)
        return leftm && rightm
    }
    // 此处还可以采用迭代法
    static func test() {
        let solution = Solution101()
        let root: TreeNode? = createNode()
        let result = solution.isSymmetric2(root)
        print(result)
    }
    
    static func createNode () -> TreeNode? {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(2)
        let node4 = TreeNode(3)
        let node5 = TreeNode(4)
        let node6 = TreeNode(4)
        let node7 = TreeNode(3)
        
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7
        return node1
    }
}
