//
//  剑指 Offer 55 - I. 二叉树的深度.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class SolutionSord55_1 {
    // 二叉树的深度
    // 层序遍历
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDep = maxDepth(root?.left)
        let rightDep =  maxDepth(root?.right)
        return max(leftDep, rightDep) + 1
    }
    
    static func test() {
        let root = createNode()
        let solution = SolutionSord55_1()
        let result = solution.maxDepth(root)
        print(result)
    }
    
    static func createNode() -> TreeNode {
        let node1 = TreeNode()
        node1.val = 3

        let node2 = TreeNode()
        node2.val = 9

        let node3 = TreeNode()
        node3.val = 20

        let node4 = TreeNode()
        node4.val = 15

        let node5 = TreeNode()
        node5.val = 7

        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        return node1
    }
}
