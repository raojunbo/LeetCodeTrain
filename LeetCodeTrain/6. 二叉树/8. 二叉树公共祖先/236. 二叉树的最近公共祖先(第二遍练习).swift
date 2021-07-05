//
//  236. 二叉树的最近公共祖先2.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution236_2 {
    // 找最近工作祖先的问题
    // 中序遍历或者后序遍历都是可以的
    var parent: TreeNode? = nil
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        postOrder(root, p, q)
        return parent
    }
    func postOrder(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        let left = postOrder(root.left, p, q)
        let right = postOrder(root.right, p, q)
        
        // 如果子树已经找到
        if left && right {
            parent = root
            return true
        }
        // 如果是要找的节点
        if root === p || root === q {
            return true
        }
        let find = left || right
        return find
    }
    static func test() {
        let node3 = TreeNode(3)
        let node5 = TreeNode(5)
        let node1 = TreeNode(1)
        let node6 = TreeNode(6)
        let node2 = TreeNode(2)
        let node0 = TreeNode(0)
        let node8 = TreeNode(8)
        let node7 = TreeNode(7)
        let node4 = TreeNode(4)
        node3.left = node5
        node5.left = node6
        node5.right = node2
        node2.left = node7
        node2.right = node4
        node3.right = node1
        node1.left = node0
        node1.right = node8
        
        let solution = Solution236_2()
        let r = solution.lowestCommonAncestor(node3, node7, node7)
        print(r)
    }
}
