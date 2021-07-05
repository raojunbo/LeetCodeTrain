//
//  222. 完全二叉树的节点个数.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/1.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 完全二叉树的节点个数
// 思路。普通的采用层序遍历
// 但是是完全的二叉树的特殊性
class Solution222 {
    // 其实思想廷精辟的
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var left = root.left
        var right = root.right
        var leftH = 0
        var rightH = 0
        // 最左边的高度
        while left != nil {
            left = left?.left
            leftH += 1
        }
        // 最右边的高度
        while right != nil {
            right = right?.right
            rightH += 1
        }
        // 1. 如果是满二叉树不用递归的取拿数目了
        if leftH == rightH {
            return 2 << leftH - 1
        }
        // 2. 如果不是满二叉树 左边的节点数 + 右边的节点数 + 本身的节点1
        return countNodes(root.left) + countNodes(root.right) + 1
    }
    static func test () {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        
        let result = Solution222().countNodes(node1)
        print(result)
    }
}
