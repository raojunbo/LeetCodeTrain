//
//  144. 二叉树的前序遍历(迭代法).swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/30.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 迭代法解
 树形结构的迭代法其实刚想是不好想的。
 需要用
 */
class Solution144_2 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var result: [Int] = []
        guard let root = root else {
            return result
        }
        // 根先入栈
        stack.append(root)
        while !stack.isEmpty {
            let top = stack.removeLast()
            result.append(top.val)
            // 先right
            if let right = top.right {
                stack.append(right)
            }
            if let left = top.left {
                stack.append(left)
            }
        }
        return result
    }
    static func test() {
        let solution = Solution144_2()
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        
        node1.right = node2
        node2.left = node3
        let result = solution.preorderTraversal(node1)
        print(result)
    }
    
}
