/*
 * @lc app=leetcode.cn id=226 lang=swift
 *
 * [226] 翻转二叉树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        invertTreeT(root)
        return root
    }
    
    func invertTreeT(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        invertTreeT(root.left)
        invertTreeT(root.right)
        let tmp = root.left
        root.left = root.right
        root.right  = tmp
    }
    
    static func test() {
        let node4:TreeNode = TreeNode(4)
        let node2:TreeNode = TreeNode(2)
        let node7:TreeNode = TreeNode(7)
        let node1:TreeNode = TreeNode(1)
        let node3:TreeNode = TreeNode(3)
        let node6:TreeNode = TreeNode(6)
        let node9:TreeNode = TreeNode(9)
        
        node4.left = node2
        node4.right = node7
        node2.left = node1
        node2.right = node3
        node7.left = node6
        node7.right  = node9
        
      
        let solution = Solution226()
        let rootNode = Solution226().invertTree(node4)
        solution.printTree(rootNode)
    }
    
    func printTree(_ root: TreeNode?) {
        var queue:[TreeNode] = []
        guard let root = root else {
            return
        }
        //打印
        queue.append(root)
        while !queue.isEmpty {
            for _ in queue {
                let node = queue.removeFirst()
                print(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
    }
    
}
// @lc code=end

