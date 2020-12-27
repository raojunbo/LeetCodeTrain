/*
 * @lc app=leetcode.cn id=297 lang=swift
 *
 * [297] 二叉树的序列化与反序列化
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

class Codec297 {
    //二叉树的序列化与反序列化
    //主要是考序列化后怎么还原的问题。一般材采用占位；
    func serialize(_ root: TreeNode?) -> String {
        var result:[String] = []
        preOrder(root,&result)
        return result.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        //将字符串分割为一个一个词
        var splitedArray = data.components(separatedBy: ",")
        let root = redescrialize(&splitedArray)
        return root
    }
    
    func redescrialize(_ array:inout [String]) -> TreeNode? {
        let first =  array.removeFirst()
        if first == "null" {
            return nil
        }
        let node = TreeNode(Int(first)!)
        node.left = redescrialize(&array)
        node.right = redescrialize(&array)
        return node
    }
    
    func preOrder(_ root: TreeNode?,_ result:inout [String]) {
        //采用前序遍历 根左右；
        guard let root = root else {
            result.append("null")
            return
        }
        
        result.append(String(root.val))
        preOrder(root.left,&result)
        preOrder(root.right,&result)
        
        return
    }
    
    static func test() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        
        let result = Codec297().serialize(node1)
        print(result)
        let renODE = Codec297().deserialize(result)
        let result2 = Codec297().serialize(renODE)
        print(result2)
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
// @lc code=end

