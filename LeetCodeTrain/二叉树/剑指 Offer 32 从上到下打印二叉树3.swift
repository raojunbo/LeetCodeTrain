//
//  剑指 Offer 32 从上到下打印二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/4.
//  Copyright © 2021 rjb. All rights reserved.
//
// 之子型打印从上到下
import Foundation
class SolutionSord32_3 {
    var queue: [TreeNode] = []
    var result: [[Int]] = []
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let relRoot = root else {
            return result
        }
        queue.insert(relRoot, at: 0)
        
        var nextCount = 0 // 记录下一层有多少个数
        var nowCount = 1 // 记录本次有多少数
        var direction = true // 0 为正方向
        var array: [Int] = []
        while queue.count > 0 {
            // 出队
            let last = queue.removeLast()
            if direction {
                array.append(last.val)
            } else {
                array.insert(last.val, at: 0)
            }
           
            nowCount -= 1
            
            // 将左节点入队
            if let left = last.left {
                queue.insert(left, at: 0)
                nextCount += 1
            }
            // 将右节点入队
            if let right = last.right {
                queue.insert(right, at: 0)
                nextCount += 1
            }
            
            if nowCount == 0 {
                result.append(array)
                array = []
                nowCount = nextCount
                nextCount = 0
                direction = !direction
            }
        }
        return result
    }

    
    static func test() {
        let solution = SolutionSord32_3()
        let rootNode = createNode()
        let result = solution.levelOrder(rootNode)
        print(result)
    }
    
    static func createNode() -> TreeNode? {
        let root = TreeNode()
        root.val = 8
        
        let left1 = TreeNode()
        left1.val = 6
        
        let right1 = TreeNode()
        right1.val = 10
        
        
        let left2 = TreeNode()
        left2.val = 5
        
        let right2 = TreeNode()
        right2.val = 7
        
        let left22 = TreeNode()
        left22.val = 9
        
        let right22 = TreeNode()
        right22.val = 11
        
        root.left = left1
        root.right = right1
        
        left1.left = left2
        left1.right = right2
        
        right1.left = left2
        right1.right = right2
        
        right1.left = left22
        right1.right = right22
        
        return root
    }
    
}
