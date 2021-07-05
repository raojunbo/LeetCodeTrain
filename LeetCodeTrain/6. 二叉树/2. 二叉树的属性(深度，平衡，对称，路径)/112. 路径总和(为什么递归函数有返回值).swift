//
//  112. 路径总和.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/3.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
//如果需要搜索整颗二叉树，那么递归函数就不要返回值，如果要搜索其中一条符合条件的路径，递归函数就需要返回值，因为遇到符合条件的路径了就要及时返回。
class Solution112 {
    // 1. 路径和 > targetSum 跳出
    // 2. 路径和 == targeSum 且是叶子
    // 3. 路径和 < argetSum ，且已经到叶子节点了
    // 这里遇到了坑；目标和可能是负数
    // 因为不是求所有的路径，所以在中途可以不满足条件
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        return preOrder(root, targetSum)
    }
    // 采用前序遍历
    func preOrder(_ node: TreeNode?, _ targetSum: Int) -> Bool{
        guard let node = node else {
            return false
        }
        // 和刚刚位目标值，且是叶子节点
        if targetSum - node.val == 0 && node.left == nil && node.right == nil {
            return true
        }
        // 只要满足条件的就可以进入下一级
        return preOrder(node.left, targetSum - node.val) || preOrder(node.right, targetSum - node.val)
    }
    static func test() {
        // 测试2
        let node5 = TreeNode(5)
        let node4_1 = TreeNode(4)
        let node8 = TreeNode(8)
        let node11 = TreeNode(11)
        let node13 = TreeNode(13)
        let node4_2 = TreeNode(4)
        let node7 = TreeNode(7)
        let node2 = TreeNode(2)
        let node1 = TreeNode(1)

        node5.left = node4_1
        node5.right = node8
        node4_1.left = node11
        node11.left = node7
        node11.right = node2
        node8.left = node13
        node8.right = node4_2
        node4_2.right = node1
        // 测试1
//        let node1 = TreeNode(1)
//        let node2 = TreeNode(2)
//        let node3 = TreeNode(3)
//        node1.left = node2
//        node1.right = node3
        
        
        let solution = Solution112()
        let result = solution.hasPathSum(node5, 22)
        print(result)
    }
}
