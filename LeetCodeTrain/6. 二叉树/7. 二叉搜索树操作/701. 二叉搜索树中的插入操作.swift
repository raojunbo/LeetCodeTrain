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
    // 利用二叉搜索树的特性，左边的都小于根，右边的都大于根
    // 在遇到nil时，将新的节点加入其位置就可以了。
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        return traver(root, val)
    }
    func traver(_ root: TreeNode?, _ val: Int) -> TreeNode?{
        guard let root = root else {
            let node = TreeNode(val)
            return node
        }
        // 当前节点已经大于val，在左边寻找查找位置
        if root.val > val {
            root.left = traver(root.left, val)
        }
        // 当前节点已经小于val,在右边寻找尾椎
        if root.val < val {
            root.right = traver(root.right, val)
        }
        return root
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
