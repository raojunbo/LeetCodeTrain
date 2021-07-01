/*
 * @lc app=leetcode.cn id=589 lang=swift
 *
 * [589] N叉树的前序遍历
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution589 {
    func preorder(_ root: Node?) -> [Int] {
    	//n 叉树的前序遍历
        var result:[Int] = []
        preorderT(root, result: &result)
        return result
    }
    
    func preorderT(_ root: Node?,result: inout [Int]) {
        guard let root = root else {
            return
        }
        result.append(root.val)
        for item in root.children {
            preorderT(item, result: &result)
        }
    }
    
    // n叉树的前序遍历
    // 第二变练习
    // 还是采用递归变量的方法
    func preorder2(_ root: Node?) -> [Int] {
        var result: [Int] = []
        visit(root, result: &result)
        return result
    }
    func visit(_ node: Node?, result: inout [Int]) {
        guard let node = node else {
            return
        }
        result.append(node.val)
        for item in node.children {
            visit(item,result: &result)
        }
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
//        [1, 3, 5, 6, 2, 4]
        let result = Solution589().preorder2(rootNode)
        print(result)
    }
}
// @lc code=end

