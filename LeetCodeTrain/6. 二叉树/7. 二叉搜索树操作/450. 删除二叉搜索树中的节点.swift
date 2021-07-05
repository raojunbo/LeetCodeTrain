//
//  450. 删除二叉搜索树中的节点.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution450 {
    // 删除一个搜索二叉树的指定节点
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        return delete(root, key)
    }
    func delete(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard var root = root else {
            return nil
        }
        if root.val == key {
            // 右为nil, 左不为Nil
            if root.right == nil {
                return root.left
            }
            // 左为nil, 右不为Nil
            if root.left == nil {
                return root.right
            }
            // 左右都不为nil
            // 右子树的最左边
            // 将root 的最左边放到root 的左边
            // 返回root为root的right
            var cur = root.right
            while cur?.left != nil {
                cur = cur?.left
            }
            cur?.left = root.left
            root = root.right!
            return root
        }
        // 当前值大于key ,应该向左找
        if root.val > key  {
            root.left =  delete(root.left, key)
        }
        if root.val < key {
            root.right = delete(root.right, key)
        }
        return root
    }
    static func test() {
        let solution = Solution450()
        let node5 = TreeNode(5)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)
        let node2 = TreeNode(2)
        let node4 = TreeNode(4)
        let node7 = TreeNode(7)
        node5.left = node3
        node5.right = node6
        node3.left = node2
        node3.right = node4
        node6.right = node7
        solution.deleteNode(node5, 3)
    }
}
