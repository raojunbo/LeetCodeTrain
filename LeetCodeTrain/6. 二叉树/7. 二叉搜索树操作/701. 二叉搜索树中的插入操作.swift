//
//  701. 二叉搜索树中的插入操作.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution701 {
    // 向一个二叉搜索树中插入数据，保证还是一个二叉搜索树
    // 里面的节点值都不相同
    // 插入值时，实际上还要保持搜索树的规则；即root比其左边要大；root比其右边要小
    // 如果右边没有值了。放在右边即可
    //
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        return preorder(root, val)
    }
    func preorder(_ root: TreeNode?, _ val: Int) -> TreeNode?{
        guard let root = root else {
            return nil
        }
        if root.val > root.left!.val{
         return nil
        }
        return nil
    }
    static func test() {
        let node4 = TreeNode(4)
        let node2 = TreeNode(2)
        let node7 = TreeNode(7)
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        
        node4.left = node2
        node2.left = node1
        node2.right = node3
        node4.right = node7
        
        let solution = Solution701()
        let result = solution.insertIntoBST(node4, 5)
        print(result)
    }
    
}
