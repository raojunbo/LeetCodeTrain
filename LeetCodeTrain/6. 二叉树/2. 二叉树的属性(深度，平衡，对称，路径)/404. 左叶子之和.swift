//
//  404. 左叶子之和.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/3.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution404 {
   
    var sum = 0
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        preOrder(root)
        return sum
    }
    func preOrder(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        // 左边节点不为nil 且左边节点为页子节点
        if let left = node.left , left.left == nil, left.right == nil {
            sum += left.val
        }
        preOrder(node.left)
        preOrder(node.right)
    }
    static func test() {
        let node1 = TreeNode(3)
        let node2 = TreeNode(9)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node5 = TreeNode(7)
        
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        
        let solution = Solution404()
        let result = solution.sumOfLeftLeaves(node1)
        print(result)
    }
}
