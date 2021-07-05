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
    // 第二变练习（完全是自己想出来的了,哈哈哈）
    // 整个的思路就是讲节点的左右进行交换就可以了
    // 那么实际上就是遍历二叉树了
    // 遍历二叉树由多种写法。前序，中序，后序，层序。（注意这里不能用中序）
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        invertT2(root)
        return root
    }
    func invertT2(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        invertT2(node.left)
        invertT2(node.right)
        let left = node.left
        let right = node.right
        node.left = right
        node.right = left
    }
    
    // 第二次练习
    // 采用层序遍历，将二叉树的点翻转
    func invertTree3(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        var queue: [TreeNode] = [root]
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                // 出队
                let node = queue.removeFirst()
                
                let tmp = node.left
                node.left = node.right
                node.right = tmp
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right =  node.right {
                    queue.append(right)
                }
                size -= 1
            }
        }
        return root
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
//        4
//        2
//        7
//        1
//        3
//        6
//        9
        
//        4
//        7
//        2
//        9
//        6
//        3
//        1
        let solution = Solution226()
        let rootNode = solution.invertTree3(node4)
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

