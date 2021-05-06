//
//  剑指 Offer 26 树的子结构.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
// 树的子结构
// 1. 在树A中找到与B的根相同的值的节点
// 2. 判定从此节点开始是否与B是相同的，可以用前序遍历法判定；前序遍历是
class SolutionSord26 {
    // 1. 中序遍历找节点
    // 2. 同一个节点
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        return isEq(A, B) || isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
    }
    func isEq(_ A:TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil {
            return true
        }
        if A == nil {
            return false
        }
        if A?.val != B?.val  {
            return false
        }
        return isEq(A?.left, B?.left) && isEq(A?.right, B?.right)
    }
    static func test() {
        let A = createOne()
        let B = createTwo()
        let result = SolutionSord26().isSubStructure(A, B)
        print(result)
    }
    static func createOne() ->TreeNode? {
        let root = TreeNode()
        root.val = 3
        
        let left1 = TreeNode()
        left1.val = 4
        
        let right1 = TreeNode()
        right1.val = 5
        
        let left2 = TreeNode()
        left2.val = 1
        
        let right2 = TreeNode()
        right2.val = 2
        
        root.left = left1
        root.right = right1
        left1.left = left2
        left1.right = right2
        return root
    }
    static func createTwo() ->TreeNode? {
        let root = TreeNode()
        root.val = 4
        
        let left1 = TreeNode()
        left1.val = 1
        root.left = left1
        return root
    }
}
