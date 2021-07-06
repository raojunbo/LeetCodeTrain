//
//  669. 修剪二叉搜索树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/6.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution669 {
    // 修剪二叉搜索树
    // 从上到下，找到小于边界最小的值；返回右子树；
    // 从上到在，找到大于边界的最大的值;返回左子树；
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        return traverse(root, low, high)
    }
    // 写代码先写不符合条件的
    // 然后写符合条件的
    func traverse(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root.val < low {
            // 找到能满足条件的节点，直接接在上层后面
            return traverse(root.right, low, high)
        }
        if root.val > high {
            return traverse(root.left, low, high)
        }
        root.left = traverse(root.left, low, high)
        root.right = traverse(root.left, low, high)
        return root
    }
    static func test() {
        // 测试1
        let node1 = TreeNode(1)
        let node0 = TreeNode(0)
        let node2 = TreeNode(2)
        node1.left = node0
        node1.right = node2
        
        // 测试2
//        let node3 = TreeNode(3)
//        let node0 = TreeNode(0)
//        let node2 = TreeNode(2)
//        let node1 = TreeNode(1)
//        let node4 = TreeNode(4)
//
//        node3.left = node0
//        node3.right = node4
//        node0.right = node2
//        node2.left = node1
        
        // 测试3
//        let node3 = TreeNode(3)
//        let node1 = TreeNode(1)
//        let node4 = TreeNode(4)
//        let node2 = TreeNode(2)
//        node3.left = node1
//        node3.right = node4
//        node1.right = node2
        
        let solution = Solution669()
        let result = solution.trimBST(node1, 1, 2)
        print(result)
    }
}
