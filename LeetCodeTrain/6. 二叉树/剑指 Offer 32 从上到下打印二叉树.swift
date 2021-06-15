//
//  剑指 Offer 32 从上到下打印二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/4.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class SolutionSord32 {
    var queue: [TreeNode] = []
    var result: [Int] = []
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let relRoot = root else {
            return result
        }
        queue.insert(relRoot, at: 0)
        while queue.count > 0 {
            // 出队
            let last = queue.removeLast()
            result.append(last.val)
            // 将左节点入队
            if let left = last.left {
                queue.insert(left, at: 0)
            }
            // 将右节点入队
            if let right = last.right {
                queue.insert(right, at: 0)
            }
        }
        return result
    }
    
    static func test() {
        let solution = SolutionSord32()
        let rootNode = createNode()
        let result = solution.levelOrder(rootNode)
        print(result)
    }
    
    static func createNode() -> TreeNode? {
        let root = TreeNode()
        root.val = 3
        
        let left1 = TreeNode()
        left1.val = 9
        
        let right1 = TreeNode()
        right1.val = 20
        
        let left2 = TreeNode()
        left2.val = 15
        
        let right2 = TreeNode()
        right2.val = 7
        
        root.left = left1
        root.right = right1
        
        right1.left = left2
        right1.right = right2
        
        return root
    }
    
}
