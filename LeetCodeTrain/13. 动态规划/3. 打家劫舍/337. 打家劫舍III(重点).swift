//
//  337. 打家劫舍III.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/24.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 这到题难度有点高
class Solution337 {
    func rob(_ root: TreeNode?) -> Int {
        let result = robTree(root)
        return max(result.0, result.1)
    }
    // 整体的遍历方式时后序遍历
    func robTree(_ cur: TreeNode?) ->(Int, Int) {
        // 0表示不偷， 1表示偷
        if cur == nil {
            return (0,0)
        }
        let left = robTree(cur?.left)
        let right = robTree(cur?.right)
        // 当前节点不偷（左右节点的最大值）
        let val0 = max(left.0, left.1) + max(right.0, right.1)
        // 当前节点偷（那么左右节点都不能偷）
        let val1 = cur!.val + left.0 + right.0
        return (val0,val1)
    }
    
    static func test() {
        let root: TreeNode? = Solution337.createRoot()
        let solution = Solution337()
        let result = solution.rob(root)
        print(result)
    }
    static func createRoot() -> TreeNode? {
        let node0 = TreeNode(3)
        let node1 = TreeNode(2)
        let node2 = TreeNode(3)
        let node3 = TreeNode(3)
        let node4 = TreeNode(1)
        node0.left = node1
        node0.right = node2
        node1.right = node3
        node2.right = node4
        return node0
    }
}
