/*
 * @lc app=leetcode.cn id=429 lang=swift
 *
 * [429] N叉树的层序遍历
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

class Solution429 {
    //层序遍历一般都是采用队列的数据结构
    //层序遍历实际上就是一种广度优先搜索
    func levelOrder(_ root: Node?) -> [[Int]] {
        var result:[[Int]] = []
        guard let root = root else {
            return result
        }
        var queue:[Node] = []
        queue.append(root)
        while !queue.isEmpty {
            var levelArray:[Int] = []
            let levelSize = queue.count //先保存每一层的个数,这一点非常重要
            for _ in 0...levelSize - 1 {
                let item =  queue.removeFirst()
                levelArray.append(item.val)
                queue.append(contentsOf: item.children)
            }
            result.append(levelArray)
        }
        return result
    }
    
    // 第二遍练习
    // n叉树的层序遍历
    // 其思路与二叉树的层序遍历相同
    // 层序遍历实际上已经形成了模板
    func levelOrder2(_ root: Node?) -> [[Int]] {
        var result:[[Int]] = []
        guard let root = root else {
            return result
        }
        var queue: [Node] = [root]
        while !queue.isEmpty {
            var levelArray: [Int] = []
            var size = queue.count
            while size > 0 {
                let node = queue.removeFirst()
                levelArray.append(node.val)
                for item in node.children {
                    queue.append(item)
                }
                size -= 1
            }
            result.append(levelArray)
        }
        return result
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
        let result = Solution429().levelOrder2(rootNode)
        print(result)
    }
}
// @lc code=end

