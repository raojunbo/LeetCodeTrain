//
//  剑指 Offer 54. 二叉搜索树的第k大节点.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/5/5.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

// 二叉搜索树的第k大节点
// 二叉搜索树中序遍历是有序的
// 中序遍历
class SolutionSord54 {
    var queue: [TreeNode] = []
    var finded: TreeNode?
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        kthLargestCur(root, k)
        if let finded = finded {
            return finded.val
        }
        return 0
    }
    func kthLargestCur(_ root: TreeNode?, _ k: Int) {
        guard let relRoot = root else {
            return
        }
        // 右， 根， 左
        kthLargestCur(relRoot.right, k)
        queue.append(relRoot)
        // 第K大的节点， 也就是
        if queue.count == k {
            finded = queue.last
            return
        }
        kthLargestCur(relRoot.left, k)
    }
    
    static func test() {
        let solution = SolutionSord54()
        let node = createNode()
        let result = solution.kthLargest(node, 1)
        print(result)
    }
    static func createNode() -> TreeNode {
        let node1 = TreeNode()
        node1.val = 3

        let node2 = TreeNode()
        node2.val = 1

        let node3 = TreeNode()
        node3.val = 4

        let node4 = TreeNode()
        node4.val = 2

        node1.left = node2
        node1.right = node3
        node2.right = node4
//
//        let node1 = TreeNode()
//        node1.val = 2
//
//        let node2 = TreeNode()
//        node2.val = 1
//
    
        
//        node1.left = node2
        return node1
    }
}
