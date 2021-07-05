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
    // 后序遍历或者后序遍历都是可以的
    // 后续遍历时典型的回溯法
    // 这里要找到最近公共祖先。采用一步异步回溯
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        return postOrder(root, p, q)
    }
    func postOrder(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root === q || root === p {
            return root
        }
        let left = postOrder(root.left, p, q)
        let right = postOrder(root.right, p, q)
        
        // 如果都不为nil， 说明root就是最近的公共及节点
        if left != nil && right != nil {
            return root
        }
        // 如果左边找到了
        if left != nil  {
            return left
        }
        // 如果是右边找到了
        if right != nil {
            return right
        }
        return nil
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
