//
//  剑指 Offer 37. 序列化二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class SolutionSord37 {
    var queue: [String] = []
    func serialize(_ root: TreeNode) -> String {
        // 序列化一个二叉树
        // 采用任何一种遍历方式都可以
        var result: String = ""
        serializeRecure(root, str: &result)
        return result
    }
    func serializeRecure(_ root: TreeNode?, str: inout String) {
        guard let relRoot = root else {
            str.append(",")
            str.append("null")
            return
        }
        if str.count != 0 {
            str.append(",")
        }
        
        str.append(String(relRoot.val))
        serializeRecure(root?.left, str: &str)
        serializeRecure(root?.right, str: &str)
    }
    func deserialize(str: String) -> TreeNode? {
        // 反序列化
        // 1,2,null,null,3,4,null,null,5,null,null
        var array = str.components(separatedBy: ",")
        return  deserializeWithArray(array: &array)
    }
    func deserializeWithArray(array: inout [String]) -> TreeNode?{
        let fistValue = array.removeFirst()
        if fistValue == "null" {
            return nil
        }
        let node = TreeNode()
        node.val = Int(fistValue) ?? 0
        let leftNode = deserializeWithArray(array: &array)
        let rightNode = deserializeWithArray(array: &array)
        node.left = leftNode
        node.right = rightNode
        return node
    }
    
    static func test() {
        let root = createNode()
        let solution = SolutionSord37()
        let result = solution.serialize(root)
        print(result)
        let result2 = solution.deserialize(str: result)
        print(result2)
    }
    
    static func createNode() -> TreeNode {
        let node1 = TreeNode()
        node1.val = 1
        
        let node2 = TreeNode()
        node2.val = 2
        
        let node3 = TreeNode()
        node3.val = 3
        
        let node4 = TreeNode()
        node4.val = 4
        
        let node5 = TreeNode()
        node5.val = 5
        
        node1.left = node2
        node1.right = node3
        
        node3.left = node4
        node3.right = node5
        
        return node1
    }
}
