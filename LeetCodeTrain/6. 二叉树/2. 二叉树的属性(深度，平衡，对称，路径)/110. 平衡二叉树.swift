//
//  110. 平衡二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/1.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution110 {
    // 第一遍练习(此题看起来简单，但处处隐藏着危机)
    // 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。
    // （左边的高度 - 右边的高度）不能超过1
    // 一个二叉树每个节点的左右两个子树的高度差的绝对值不超过 1 。
    // 思路：实际上在求左右子树的过程中。只要有高度不满足条件时，即刻退出
    func isBalanced(_ root: TreeNode?) -> Bool {
        return depth(root) != -1
    }
    func depth(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftH = depth(node.left)
        if leftH == -1 {
            return  -1
        }
        let rightH = depth(node.right)
        if rightH == -1{
          return -1
        }
        let height = abs(leftH - rightH) <= 1 ? max(leftH, rightH) + 1 : -1
        return height
    }
    
    static func test() {
        let node1 = TreeNode(3)
        let node2 = TreeNode(9)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node5 = TreeNode(7)
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        let solution = Solution110()
        let result = solution.isBalanced(node1)
        print(result)
    }
}
