//
//  TreeNode.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/30.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 二叉树节点的定义
 */
public class TreeNode {
    public var val:Int
    public var left:TreeNode?
    public var right:TreeNode?
    public init () {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val:Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val:Int,_ left:TreeNode?,_ right:TreeNode? ) {
        self.val = val
        self.left = left
        self.right = right
    }
}
