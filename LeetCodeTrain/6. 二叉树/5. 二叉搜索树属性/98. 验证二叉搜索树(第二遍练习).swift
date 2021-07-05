//
//  98. 验证二叉搜索树(第二遍练习).swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution98_2 {
    // 第二遍练习
    // 二叉搜索树的中序遍历是有序的。
    // 所以只需要进行中序遍历即可
    // 实际上是利用了二叉搜索树的特性
    var lastTreeNode: TreeNode?
    func isValidBST(_ root: TreeNode?) -> Bool {
        return inOrder(root)
    }
    func inOrder(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        let leftValid = inOrder(root.left)
        if let last = lastTreeNode, last.val >= root.val {
            return false
        }
        lastTreeNode = root
        let rightValid = inOrder(root.right)
        return leftValid && rightValid
    }
    static func test() {
        // 测试1
//        let node5 = TreeNode(5)
//        let node1 = TreeNode(1)
//        let node4 = TreeNode(4)
//        let node3 = TreeNode(3)
//        let node6 = TreeNode(6)
//        node5.left = node1
//        node5.right = node4
//        node4.left = node3
//        node4.right = node6
        
        // 测试2
        let node2 = TreeNode(2)
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        node2.left = node1
        node2.right = node3
        let solution = Solution98_2()
        let result = solution.isValidBST(node2)
        print(result)
    }
}
