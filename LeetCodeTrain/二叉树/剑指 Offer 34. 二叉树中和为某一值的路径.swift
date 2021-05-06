//
//  剑指 Offer 34. 二叉树中和为某一值的路径.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class SolutionSord34 {
    var result: [[Int]] = [] // 存结果
    var queue: [TreeNode] = [] // 存路径
    var sum: Int  = 0
    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
        if root == nil {
            return []
        }
        findTarget(root, target)
        return result
    }
    func findTarget(_ root: TreeNode?, _ target: Int) {
        guard let relRoot = root  else {
            return
        }
        queue.insert(relRoot, at: 0)
        sum = sum + root!.val
        if sum == target && root?.left == nil && root?.right == nil{
            // 生成路径
            let array = generPath()
            result.append(array)
        }
        findTarget(root?.left, target)
        findTarget(root?.right, target)
        queue.remove(at: 0)
        sum = sum - root!.val
    }
    func generPath() -> [Int] {
        var array: [Int] = []
        for item in queue.reversed() {
            array.append(item.val)
        }
        return array
    }
    
    static func test() {
        let root = createNode()
        let solution = SolutionSord34()
        let result = solution.pathSum(root, 22)
        print(result)
    }
    static func createNode() -> TreeNode? {
//        let node1 = TreeNode()
//        node1.val = 5
//
//        let node2 = TreeNode()
//        node2.val = 4
//
//        let node3 = TreeNode()
//        node3.val = 8
//
//        let node4 = TreeNode()
//        node4.val = 11
//
//        let node5 = TreeNode()
//        node5.val = 13
//
//        let node6 = TreeNode()
//        node6.val = 4
//
//        let node7 = TreeNode()
//        node7.val = 7
//
//        let node8 = TreeNode()
//        node8.val = 2
//
//        let node9 = TreeNode()
//        node9.val = 5
//
//        let node10 = TreeNode()
//        node10.val = 1
//
//        node1.left = node2
//        node1.right = node3
//
//        node2.left = node4
//
//        node4.left = node7
//        node4.right = node8
//
//        node3.left = node5
//        node3.right = node6
//
//        node6.left = node9
//        node6.right = node10
        let node1 = TreeNode()
        node1.val = 1
        
        return node1
    }
    
}
