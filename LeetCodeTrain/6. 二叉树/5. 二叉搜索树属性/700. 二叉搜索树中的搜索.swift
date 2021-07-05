//
//  700. 二叉搜索树中的搜索.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution700 {
    // 二叉搜索树中的搜索的中序遍历是一个有序
    var result: TreeNode?
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        inOrder(root, val)
        return result
    }
    func inOrder(_ root: TreeNode?, _ val: Int) {
        guard let root = root else {
            return
        }
        inOrder(root.left, val)
        // 找到了
        if root.val == val {
            result = root
            return
        }
        // 没有找到
        if root.val > val {
            return
        }
        // 继续在右子树查找
        inOrder(root.right, val)
    }
    static func test() {
        let node4 = TreeNode(4)
        let node2 = TreeNode(2)
        let node7 = TreeNode(7)
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        
        node4.left = node2
        node4.right = node7
        node2.left = node1
        node2.right = node3
        
        let solution = Solution700()
        let result = solution.searchBST(node4, 2)
        print(result)
    }
}
