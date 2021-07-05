//
//  257. 二叉树的所有路径.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/3.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution257 {
    // 求二叉树的所有路径
    // 其实还是二叉树的遍历
    // 所谓的回溯，所谓的路径。就是一路遍历一路位置路径，然后在适当的条件下退出并记录结果
    var path: [String] = []
    var result: [String] = []
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        preOrder(root)
        return result
    }
    // 求路径一般采用前序
    func preOrder(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        path.append(String(node.val))
        if node.left == nil && node.right == nil {
            result.append(path.joined(separator: "->"))
            path.removeLast()
            return
        }
        preOrder(node.left)
        preOrder(node.right)
        path.removeLast()
    }
    static func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(5)
        
        node1.left = node2
        node1.right = node3
        node2.right = node4
        let solution = Solution257()
        let result = solution.binaryTreePaths(node1)
        print(result)
    }
}
