//
//  501. 二叉搜索树种的众数.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution501 {
    // 采用回溯法；
    // 采用后序遍历。求此子树的最大个数
    // 主要是考虑到众数如果有很多的情况下怎么做
    
    var maxCount = 0
    var result: [Int] = []
    
    var curCount = 0
    var curResult: Int = -1
    
    func findMode(_ root: TreeNode?) -> [Int] {
        inorder(root)
        return result
    }
    func inorder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inorder(root.left)
        
        if root.val == curResult {
            curCount += 1
        } else {
            curCount = 1
            curResult = root.val
        }
        // 产生了并列的个数
        if curCount == maxCount {
            result.append(root.val)
            maxCount = curCount
        }
        // 当已经有最大的产生
        if curCount > maxCount {
            result.removeAll()
            result.append(root.val)
            maxCount = curCount
        }
        inorder(root.right)
    }
    
    static func test() {
        let node1 = TreeNode(1)
        let node1_2 = TreeNode(1)
        let node2_1 = TreeNode(2)
        let node2_2 = TreeNode(2)
        node1.right = node2_1
        node1.left = node1_2
        node2_1.left = node2_2
        
        let solution = Solution501()
        let result = solution.findMode(node1)
        print(result)
    }
}
