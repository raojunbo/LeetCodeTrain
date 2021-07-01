//
//  Node.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/30.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
/**
 n 叉树节点的定义
 */
public class Node {
    public var val:Int
    public var children:[Node]
    init(_ val:Int) {
        self.val = val
        self.children = []
    }
}
