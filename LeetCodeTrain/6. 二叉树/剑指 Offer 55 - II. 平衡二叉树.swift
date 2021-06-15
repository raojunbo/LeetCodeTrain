//
//  剑指 Offer 55 - I. 二叉树的深度.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class SolutionSord55_2 {
    // 这种方法没有做出来
    func isBalanced2(_ root: TreeNode?) -> Bool {
        // 采用后序遍历算法
        // 左， 右， 中
        var depth: Int = 0
        return isBalancedCore(root, &depth)
    }
    func isBalancedCore(_ root: TreeNode?, _ depth: inout Int) -> Bool {
        if root == nil {
            depth = 0
            return true
        }
        var leftDep: Int = 0
        var rightDep: Int = 0
        let leftBalance = isBalancedCore(root?.left, &leftDep)
        let rightBalance = isBalancedCore(root?.right, &rightDep)
        if leftBalance && rightBalance {
            if abs(leftDep - rightDep) <= 1  {
                depth = 1 + max(leftDep, rightDep)
               return true
            }
           
        }
        return false
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    // 以下是一种比较低效的方法
    func isBalanced(_ root: TreeNode?) -> Bool {
        let leftDep = maxDepth(root?.left)
        let rightDep = maxDepth(root?.right)
        if abs(leftDep - rightDep) > 1 {
            return false
        }
        let leftBalance = isBalanced(root?.left)
        let rightBalance = isBalanced(root?.right)
        return leftBalance && rightBalance
    }
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
        let solution = SolutionSord55_2()
        let result = solution.isBalanced2(root)
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
