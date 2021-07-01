//
//  110. 平衡二叉树.swift
//  LeetCodeTrain
//
//  Created by rjb on 2021/7/1.
//  Copyright © 2021 rjb. All rights reserved.
//

import Foundation
class Solution110 {
    func isBalanced(_ root: TreeNode?) -> Bool {
      return false
    }
    static func test() {
        let rootNode = Node(1)
        let node3 = Node(3)
        let node2 = Node(2)
        let node4 = Node(4)
        let node5 = Node(5)
        let node6 = Node(6)
        
        rootNode.children.append(node3)
        rootNode.children.append(node2)
        rootNode.children.append(node4)
        node3.children.append(node5)
        node3.children.append(node6)
        //        [[1], [3, 2, 4], [5, 6]]
        //        [[1], [3, 2, 4], [5, 6]]
        let result = Solution559().maxDepth2(rootNode)
        print(result)
    }
}
