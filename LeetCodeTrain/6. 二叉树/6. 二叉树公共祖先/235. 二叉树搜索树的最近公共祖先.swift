//
//  235. 二叉树搜索树的最近公共祖先.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution235 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
       return preorder(root, p: p, q: q)
    }
    // 因为二叉搜索树的特性；root节点比起左边的都大，比其右边的都小
    // 其实只要从上到下遍历的时候，cur节点是数值在[p, q]区间中则说明该节点cur就是最近公共祖先了。
    func preorder(_ root: TreeNode?, p: TreeNode?, q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if root.val > p!.val && root.val > q!.val {
            // 说明要去左边去找
            return preorder(root.left, p: p, q: q)
        } else if root.val < p!.val && root.val < q!.val {
            //
            return preorder(root.right, p: p, q: q)
        }
        return root
    }
    static func test() {
        let node3 = TreeNode(3)
        let node5 = TreeNode(5)
        let node1 = TreeNode(1)
        let node6 = TreeNode(6)
        let node2 = TreeNode(2)
        let node0 = TreeNode(0)
        let node8 = TreeNode(8)
        let node7 = TreeNode(7)
        let node4 = TreeNode(4)
        node3.left = node5
        node5.left = node6
        node5.right = node2
        node2.left = node7
        node2.right = node4
        node3.right = node1
        node1.left = node0
        node1.right = node8
        
        let solution = Solution236_2()
        let result = solution.lowestCommonAncestor(node3, node7, node7)
        print(result)
    }
}
