//
//  101. 对称二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution101 {
    // 是否是对称二叉树的判定
    // 肯定是用递归去解决
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left!.val != right!.val {
            return false
        }
        let leftM = isMirror(left?.left, right?.right)
        let rightM = isMirror(left?.right, right?.left)
        return leftM && rightM
    }
    static func test() {
        let solution = Solution101()
        let root: TreeNode? = createNode()
        let result = solution.isSymmetric(root)
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
