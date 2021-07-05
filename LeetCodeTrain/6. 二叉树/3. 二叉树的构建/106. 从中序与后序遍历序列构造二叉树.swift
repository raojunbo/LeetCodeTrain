//
//  106. 从中序与后序遍历序列构造二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution106 {
    // 第一遍练习
    // 中序遍历（左根右）：顶分区
    // 后序遍历(左右根)：顶根
    // 思路：先从后序遍历找到根，然后重中序遍历找到左子树个数，右子树个数；
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
      return build(inorder: inorder, inStart: 0, inEnd: inorder.count - 1, postorder: postorder, postStart: 0, postEnd: postorder.count - 1)
    }
    // 所有的都是闭合区间
    func build(inorder: [Int],inStart: Int, inEnd: Int, postorder: [Int], postStart: Int, postEnd: Int) -> TreeNode? {
        if inStart > inEnd {
            return nil
        }
        if postStart > postEnd {
            return nil
        }
        // 根value
        let rootValue = postorder[postEnd]
        // 求中序遍历位置
        var nextInEnd = inStart
        for i in inStart...inEnd {
            let item = inorder[i]
            if item == rootValue {
                nextInEnd = i
                break
            }
        }
        // 求后序遍历位置
        let length = nextInEnd - inStart
        let nextPostEnd = postStart + length
        
       // 左子树
        let leftNode = build(inorder: inorder, inStart: inStart, inEnd: nextInEnd - 1, postorder: postorder, postStart: postStart, postEnd: nextPostEnd - 1)
        // 右子树
        let rightNode = build(inorder: inorder, inStart: nextInEnd + 1, inEnd: inEnd, postorder: postorder, postStart: nextPostEnd, postEnd: postEnd - 1)
        
        let root = TreeNode(rootValue)
        root.left = leftNode
        root.right = rightNode
        return root
    }
    
    static func test(){
        let postorder = [9,15,7,20,3]
        let inorder = [9,3,15,20,7]
        let solution = Solution106()
        let root = solution.buildTree(inorder,postorder )
        print(root)
    }
}

