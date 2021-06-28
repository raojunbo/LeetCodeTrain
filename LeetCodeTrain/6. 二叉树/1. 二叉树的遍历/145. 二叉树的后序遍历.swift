//
//  145. 二叉树的后序遍历.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/27.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution145 {
    // 第一遍练习
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var array: [Int] = []
        postorderT(root, array: &array)
        return array
    }
    func postorderT(_ root: TreeNode?, array: inout [Int]) {
        if root == nil {
            return
        }
        postorderT(root?.left, array: &array)
        postorderT(root?.right, array: &array)
        array.append(root!.val)
    }
    static func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node1.right = node2
        node2.left = node3
        let result = Solution145().postorderTraversal(node1)
        print(result)
    }
}
