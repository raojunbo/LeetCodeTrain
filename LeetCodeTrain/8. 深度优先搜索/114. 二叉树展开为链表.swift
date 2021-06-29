//
//  114. 二叉树展开为链表.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/29.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution114 {
    // 展开二叉树为一个链表
    // 实际上用一个数组存前序遍历的结果
    // 然后将其连接起来你
    var array: [TreeNode] = []
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        preOrder(root)
        var last: TreeNode? = root
        for index in 1..<array.count {
            let item = array[index]
            last?.right = item
            last?.left = nil
            last = item
        }
        root.left = nil
    }
    func preOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        array.append(root)
        preOrder(root.left)
        preOrder(root.right)
    }
    
    static func test() {
        let root = createNode()
        let solution = Solution114()
        let result = solution.flatten(root)
        print(result)
    }
    
    static func createNode () -> TreeNode? {
//        let node1 = TreeNode(1)
//        let node2 = TreeNode(2)
//        node1.right = node2
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)

        let node3 = TreeNode(5)
        let node4 = TreeNode(3)
        let node5 = TreeNode(4)
        let node6 = TreeNode(6)
//
//
        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
        node3.right = node6
        
        return node1
    }
    
}
