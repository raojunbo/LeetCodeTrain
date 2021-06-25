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

public class Node {
    public var val:Int
    public var children:[Node]
    init(_ val:Int) {
        self.val = val
        self.children = []
    }
}

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
}
// @lc code=end

