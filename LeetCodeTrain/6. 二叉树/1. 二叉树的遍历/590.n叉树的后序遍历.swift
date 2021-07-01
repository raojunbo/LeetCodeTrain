/*
 * @lc app=leetcode.cn id=590 lang=swift
 *
 * [590] N叉树的后序遍历
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

class Solution590 {
    func postorder(_ root: Node?) -> [Int] {
        var result:[Int] = []
        postorderT(root, result: &result)
    	return result
    }
    
    func postorderT(_ root: Node?, result:inout [Int]) {
        guard let root = root else {
            return
        }
        //遍历子节点
        for item in root.children {
            postorderT(item, result: &result)
        }
        //没有子节点了
        result.append(root.val)
    }
    
    // 第二次练习
    func postorder2(_ root: Node?) -> [Int] {
        var result: [Int] = []
        visit(root, result: &result)
        return result
    }
    func visit(_ node: Node?, result: inout [Int]) {
        guard let node = node else {
            return
        }
        for item in node.children {
            visit(item, result: &result)
        }
        result.append(node.val)
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
//      [5, 6, 3, 2, 4, 1]
//      [5, 6, 3, 2, 4, 1]
        let result = Solution590().postorder(rootNode)
        print(result)
    }
}
// @lc code=end

