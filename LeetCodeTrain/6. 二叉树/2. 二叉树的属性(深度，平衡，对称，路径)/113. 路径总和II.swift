//
//  113. 路径总和II.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution113 {
    // 本次是找出所有的路径
    // 所以所有的节点都得遍历到.
    var path: [Int] = []
    var result: [[Int]] = []
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        preOder(root, targetSum)
        return result
    }
    func preOder(_ node: TreeNode?, _ targetSum: Int) {
        guard let node = node else {
            return
        }
        if targetSum - node.val == 0 && node.left == nil && node.right == nil {
            path.append(node.val)
            result.append(path)
            path.removeLast()
            return
        }
        // 左子树
        path.append(node.val)
        preOder(node.left, targetSum - node.val)
        path.removeLast()
        // 右子树
        path.append(node.val)
        preOder(node.right, targetSum - node.val)
        path.removeLast()
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
        let node5_2 = TreeNode(5)
        
        node5.left = node4_1
        node5.right = node8
        node4_1.left = node11
        node11.left = node7
        node11.right = node2
        node8.left = node13
        node8.right = node4_2
        node4_2.left = node5_2
        node4_2.right = node1
        
        // 测试1
//        let node1 = TreeNode(1)
//        let node2 = TreeNode(2)
//        let node3 = TreeNode(3)
//        node1.left = node2
//        node1.right = node3
        
        
        let solution = Solution113()
        let result = solution.pathSum(node5, 22)
        print(result)
    }
}
