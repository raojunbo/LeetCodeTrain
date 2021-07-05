//
//  530. 二叉搜索树的最小绝对差.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution530 {
    // 实际上就是一个中序遍历
    var last: TreeNode?
    var minDiff = Int.max
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        inOrder(root)
        return minDiff
    }
    
    func inOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inOrder(root.left)
        if let last = last {
            let nowDiff = root.val - last.val
            if nowDiff < minDiff {
                minDiff = nowDiff
            }
        }
        last = root
        inOrder(root.right)
    }
    
    static func test() {
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node2 = TreeNode(2)
        node1.right = node3
        node3.left = node2
        
        let solution = Solution530()
        let result = solution.getMinimumDifference(node1)
        print(result)
    }
}
