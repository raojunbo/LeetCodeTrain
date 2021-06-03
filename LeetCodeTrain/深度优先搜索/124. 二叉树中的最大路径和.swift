//
//  124. 二叉树中的最大路径和.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/31.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution124 {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        let _ = maxGain(root, &maxSum)
        return maxSum
    }
    func maxGain(_ tree: TreeNode?, _ maxSum: inout Int) -> Int {
        if tree == nil {
            return 0
        }
        // 整个的思路：
        // 以当前节点为为考虑对象；最大值，有三中情况
        // 边线路径和
        let leftMax = max(maxGain(tree?.left, &maxSum),0)
        // 边线路径和
        let rightMax = max(maxGain(tree?.right, &maxSum),0)
        // 考虑到包括当前根节点的左右两边+当前根节点是最大值
        let priceNewPath = (tree?.val ?? 0) + leftMax + rightMax
        // 历史maxSum 与 当前根节点比较
        maxSum = max(maxSum, priceNewPath)
        // 返回的是边线路径和
        return max(leftMax, rightMax) + (tree?.val ?? 0)
    }
    static func test() {
        let root: TreeNode? = createNode()
        let solution = Solution124()
        let result = solution.maxPathSum(root)
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
