//
//  55. n叉树的最大深度.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/1.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution559 {
    // 第一遍练习
    // n 叉树的深度
    // 可以采用层序遍历
    // 也可以采用深度优先宾利
    func maxDepth(_ root: Node?) -> Int {
        return maxDepthRecuse(root)
    }
    func maxDepthRecuse(_ node: Node?) -> Int {
        guard let node = node else {
            return 0
        }
        // 在所有子节点中的最深的一个
        var max = 0
        for item in node.children {
            let nodeD =  maxDepthRecuse(item)
            if nodeD > max {
               max = nodeD
            }
        }
       return max + 1
    }
    // 第一边练习
    // n 叉树的深度
    // 采用层序遍历法
    func maxDepth2(_ root: Node?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue: [Node] = []
        queue.append(root)
        var level = 0
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                let node = queue.removeFirst()
                for item in node.children {
                    queue.append(item)
                }
                size -= 1
            }
            level += 1
        }
        return level
    }

    static func test() {
        let rootNode = Node(1)
        let node3 = Node(3)
        let node2 = Node(2)
        let node4 = Node(4)
        let node5 = Node(5)
        let node6 = Node(6)
        
        rootNode.children.append(node3)
        rootNode.children.append(node2)
        rootNode.children.append(node4)
        node3.children.append(node5)
        node3.children.append(node6)
//        [[1], [3, 2, 4], [5, 6]]
//        [[1], [3, 2, 4], [5, 6]]
        let result = Solution559().maxDepth2(rootNode)
        print(result)
    }
}
