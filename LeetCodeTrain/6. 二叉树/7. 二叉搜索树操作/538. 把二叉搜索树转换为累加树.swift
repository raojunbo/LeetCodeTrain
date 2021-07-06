//
//  538. 把二叉搜索树转换为累加树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/6.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution538 {
    // 采用中序遍历，右，中，左
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        inorder(root)
        return root
    }
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        // 右边
        inorder(root.right)
        let sum = (root.left?.val ?? 0) + (root.right?.val ?? 0) + root.val
        root.val = sum
        // 左边
        inorder(root.left)
    }
    static func test() {
        let node4 = TreeNode(4)
        let node1 = TreeNode(1)
        let node0 = TreeNode(0)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)
        let node5 = TreeNode(5)
        let node7 = TreeNode(7)
        let node8 = TreeNode(8)
        
        node4.left = node1
        node1.left = node0
        node1.right = node2
        node2.right = node3
        node4.right = node6
        node6.left = node5
        node6.right = node7
        node7.right = node8
        
        let solution = Solution538()
        let result = solution.convertBST(node4)
        print(result)
    }
}
