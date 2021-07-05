//
//  513. 找树左下角的值.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/3.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution513 {
    // 采用层序遍历
    // 层序遍历要借助于队列
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue: [TreeNode] = []
        queue.append(root)
        // 每行第一个
        var levelFirst: TreeNode = root
        while !queue.isEmpty {
            let size = queue.count
            var remain = size
            while remain > 0 {
                if size == queue.count {
                    levelFirst = queue.first!
                }
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                remain -= 1
            }
        }
        return levelFirst.val
    }
    static func test() {
        // 测试2
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        let node7 = TreeNode(7)

        node1.left = node2
        node1.right = node3

        node2.left = node4

        node3.left = node5
        node3.right = node6

        node5.left = node7
        // 测试1
//        let node1 = TreeNode(2)
//        let node2 = TreeNode(1)
//        let node3 = TreeNode(3)
//
//        node1.left = node2
//        node1.right = node3
        
        let solution = Solution513()
        let result = solution.findBottomLeftValue(node1)
        print(result)
    }
}
