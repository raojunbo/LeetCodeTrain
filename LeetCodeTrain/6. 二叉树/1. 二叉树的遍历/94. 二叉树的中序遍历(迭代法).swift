//
//  94. 二叉树的中序遍历(迭代法).swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/6/30.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation

class Solution94_2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        //采用循环迭代的方法
        guard let root = root else {
            return []
        }
        var array:[Int] = []
        var stack:[TreeNode] = []
        var last:TreeNode? = root
        while last != nil || !stack.isEmpty {
            while last != nil {
                stack.append(last!)
                last = last?.left
            }
            last = stack.last
            stack.removeLast()
            if let tmp = last {
                array.append(tmp.val)
            }
            last = last?.right
        }
        return array
    }
    
    // 第二练习
    // 二叉树的中序遍历迭代法第二遍
    // 还是比较难写出来的
    // 思路先不断的将左节点加入栈；
    // 然后出栈
    // 然后查看出栈点左节点不断入栈
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var cur = root
        while cur != nil || !stack.isEmpty {
            if let tmpCur = cur {
                stack.append(tmpCur)
                cur = tmpCur.left
            } else {
                cur = stack.removeLast()
                result.append(cur!.val)
                cur = cur?.right
            }
        }
        return result
    }
    static func test() {
        let solution = Solution94_2()
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        
        node1.right = node2
        node2.left = node3
        let result = solution.inorderTraversal2(node1)
        print(result)
    }
}
