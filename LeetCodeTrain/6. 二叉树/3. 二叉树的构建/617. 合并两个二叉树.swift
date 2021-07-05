//
//  617. 合并而叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution617 {
    // 思路：同时遍历(第一遍自己出来的)
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        return preOrder(root1, root2: root2)
    }
    func preOrder(_ root1: TreeNode?, root2: TreeNode?) -> TreeNode? {
        // 两者都为空
        if root1 == nil && root2 == nil {
          return nil
        }
        // tree1为空，tree2不为空
        if root1 == nil && root2 != nil {
            return root2
        }
        // tree2 为空，tree1不为空
        if root2 == nil && root1 != nil {
            return root1
        }
        // 两边都有
        root1?.val = root1!.val + root2!.val
        root1?.left =  preOrder(root1?.left, root2: root2?.left)
        root1?.right = preOrder(root1?.right, root2: root2?.right)
        return root1
    }
    static func test(){
        let tree1 = createTree1()
        let tree2 = createTree2()
        let solution = Solution617()
        let result = solution.mergeTrees(tree1, tree2)
        print(result)
    }
    static func createTree1() -> TreeNode? {
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node2 = TreeNode(2)
        let node5 = TreeNode(5)
        node1.left = node3
        node1.right = node2
        node3.left = node5
        return node1
    }
    static func createTree2() -> TreeNode?{
        let node2 = TreeNode(2)
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node7 = TreeNode(7)
        node2.left = node1
        node2.right = node3
        node1.right = node4
        node3.right = node7
        return node2
    }
}
